-- 觸發器函式-更新 transactions 的 updated_at 欄位
CREATE OR REPLACE FUNCTION update_transactions_on_commodities_update()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE transactions
  SET updated_at = now()
  WHERE commodity = NEW.id;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 觸發器函式-更新 character_commodities 的 updated_at 欄位
CREATE OR REPLACE FUNCTION update_character_commodities_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE character_commodities
  SET updated_at = now()
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