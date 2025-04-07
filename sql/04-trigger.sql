-- 觸發器函式-更新 transactions 的 updated_at 欄位
CREATE OR REPLACE FUNCTION update_transactions_on_commodities_update()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE transactions
  SET updated_at = NOW()
  WHERE commodity = NEW.id;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 觸發器函式-更新 character_commodities 的 updated_at 欄位
CREATE OR REPLACE FUNCTION update_character_commodities_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE character_commodities
  SET updated_at = NOW()
  WHERE id = NEW.character_commodity_id;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 觸發器-當 commodities 被更新時，更新 transactions 的 updated_at 欄位
CREATE TRIGGER trg_update_transactions_on_commodities
AFTER INSERT OR UPDATE OR DELETE
ON commodities
FOR EACH ROW
EXECUTE FUNCTION update_transactions_on_commodities_update();

-- 觸發器-當 character_gear_scores 被更新時，更新 character_commodities 的 updated_at 欄位
CREATE TRIGGER trg_update_character_commodities_on_gear_scores
AFTER INSERT OR UPDATE OR DELETE
ON character_gear_scores
FOR EACH ROW
EXECUTE FUNCTION update_character_commodities_updated_at();

-- 觸發器-當 character_arena_scores 被更新時，更新 character_commodities 的 updated_at 欄位
CREATE TRIGGER trg_update_character_commodities_on_arena_scores
AFTER INSERT OR UPDATE OR DELETE
ON character_arena_scores
FOR EACH ROW
EXECUTE FUNCTION update_character_commodities_updated_at();

-- 觸發器-當 character_skin_counts 被更新時，更新 character_commodities 的 updated_at 欄位
CREATE TRIGGER trg_update_character_commodities_on_skin_counts
AFTER INSERT OR UPDATE OR DELETE
ON character_skin_counts
FOR EACH ROW
EXECUTE FUNCTION update_character_commodities_updated_at();

-- 創建序列來跟踪每日訂單序號
CREATE SEQUENCE daily_order_seq START 1 MINVALUE 0 MAXVALUE 99999 CYCLE;
-- 創建函數來生成訂單編號
CREATE OR REPLACE FUNCTION generate_order_id()
RETURNS VARCHAR AS $$
DECLARE
    today_date TEXT;
    seq_num TEXT;
    last_date TEXT;
    current_seq INT;
BEGIN
    -- 獲取今天的日期，格式為 YYYYMMDD
    today_date := to_char(current_date, 'YYYYMMDD');
    
    -- 檢查是否已有今天的訂單，如果是新的一天則重置序列
    SELECT to_char(MAX(created_at), 'YYYYMMDD') INTO last_date
    FROM transactions
    WHERE created_at >= current_date - interval '1 day';
    
    IF last_date IS NULL OR last_date != today_date THEN
        -- 如果是新的一天，重置序列
        ALTER SEQUENCE daily_order_seq RESTART WITH 1;
    END IF;
    
    -- 獲取下一個序列值
    SELECT nextval('daily_order_seq') INTO current_seq;
    
    -- 將序列值格式化為 5 位數字
    seq_num := lpad(current_seq::TEXT, 5, '0');
    
    -- 返回完整的訂單編號
    RETURN 'ORD' || today_date || seq_num;
END;
$$ LANGUAGE plpgsql;
-- 創建觸發器來自動填充訂單編號
CREATE OR REPLACE FUNCTION set_order_id()
RETURNS TRIGGER AS $$
BEGIN
    -- 只有在未提供 order_id 時才自動生成
    IF NEW.order_id IS NULL THEN
        NEW.order_id := generate_order_id();
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 綁定觸發器到 transactions 表
CREATE TRIGGER trg_update_transactions_on_order_id
BEFORE INSERT ON transactions
FOR EACH ROW
EXECUTE FUNCTION set_order_id();

-- 創建觸發器函數，確保一個商品只能被一個子表引用
CREATE OR REPLACE FUNCTION check_commodity_uniqueness()
RETURNS TRIGGER AS $$
DECLARE
    coin_count INTEGER;
    appearance_count INTEGER;
    character_count INTEGER;
    total_count INTEGER;
BEGIN
    -- 檢查商品是否已存在於其他子表
    SELECT COUNT(*) INTO coin_count FROM coin_commodities WHERE commodity_id = NEW.commodity_id;
    SELECT COUNT(*) INTO appearance_count FROM appearance_commodities WHERE commodity_id = NEW.commodity_id;
    SELECT COUNT(*) INTO character_count FROM character_commodities WHERE commodity_id = NEW.commodity_id;
    
    -- 計算總數（包括當前插入/更新）
    IF TG_TABLE_NAME = 'coin_commodities' THEN
        total_count := 1 + appearance_count + character_count;
    ELSIF TG_TABLE_NAME = 'appearance_commodities' THEN
        total_count := coin_count + 1 + character_count;
    ELSIF TG_TABLE_NAME = 'character_commodities' THEN
        total_count := coin_count + appearance_count + 1;
    END IF;
    
    -- 如果總數大於1，則拒絕操作
    IF total_count > 1 THEN
        RAISE EXCEPTION 'Commodity ID % already exists in another commodity table', NEW.commodity_id;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 為每個子表添加觸發器
CREATE TRIGGER check_coin_commodity_uniqueness
BEFORE INSERT OR UPDATE ON coin_commodities
FOR EACH ROW EXECUTE FUNCTION check_commodity_uniqueness();

CREATE TRIGGER check_appearance_commodity_uniqueness
BEFORE INSERT OR UPDATE ON appearance_commodities
FOR EACH ROW EXECUTE FUNCTION check_commodity_uniqueness();

CREATE TRIGGER check_character_commodity_uniqueness
BEFORE INSERT OR UPDATE ON character_commodities
FOR EACH ROW EXECUTE FUNCTION check_commodity_uniqueness();