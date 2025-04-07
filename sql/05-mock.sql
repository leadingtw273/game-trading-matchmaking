-- 插入模擬發布者數據
INSERT INTO "posters" ("nickname", "avatar_url", "game_id")
VALUES
  ('劍俠大師', 'https://example.com/avatars/master.jpg', 'player123'),
  ('江湖遊俠', 'https://example.com/avatars/ranger.jpg', 'player456'),
  ('天下無雙', 'https://example.com/avatars/unique.jpg', 'player789'),
  ('武林高手', 'https://example.com/avatars/expert.jpg', 'player101'),
  ('獨孤求敗', 'https://example.com/avatars/unbeatable.jpg', 'player202'),
  ('風雲使者', 'https://example.com/avatars/messenger.jpg', 'player303'),
  ('神劍仙子', 'https://example.com/avatars/fairy.jpg', 'player404'),
  ('霸刀王者', 'https://example.com/avatars/bladeknight.jpg', 'player505'),
  ('冰心仙女', 'https://example.com/avatars/icefairy.jpg', 'player606'),
  ('火焰戰神', 'https://example.com/avatars/firegod.jpg', 'player707');

-- 插入模擬發布者聯絡方式
INSERT INTO "poster_contacts" ("poster_id", "type", "value")
VALUES
  (1, 'LINE', 'master_line'),
  (1, 'DISCORD', 'master#1234'),
  (2, 'LINE', 'ranger_line'),
  (2, 'FACEBOOK', 'facebook.com/ranger'),
  (3, 'DISCORD', 'unique#5678'),
  (4, 'PRIVATE_MESSAGE', 'expert_pm'),
  (5, 'LINE', 'unbeatable_line'),
  (5, 'DISCORD', 'unbeatable#9012'),
  (6, 'LINE', 'messenger_line'),
  (6, 'FACEBOOK', 'facebook.com/messenger'),
  (7, 'DISCORD', 'fairy#3456'),
  (7, 'PRIVATE_MESSAGE', 'fairy_pm'),
  (8, 'LINE', 'bladeknight_line'),
  (9, 'DISCORD', 'icefairy#7890'),
  (10, 'FACEBOOK', 'facebook.com/firegod');

-- 插入基礎商品數據
INSERT INTO "commodities" ("type", "remark", "tags")
VALUES
  ('character', '高級角色，多門派技能', ARRAY['高級', '多門派', '滿級']),
  ('character', '初級角色，適合新手', ARRAY['初級', '新手', '便宜']),
  ('character', '中級角色，性價比高', ARRAY['中級', '性價比', '推薦']),
  ('appearance', '限量外觀，非常稀有', ARRAY['稀有', '限量', '外觀']),
  ('appearance', '普通外觀，價格實惠', ARRAY['普通', '實惠', '外觀']),
  ('coin', '大量金幣，批發價', ARRAY['大量', '批發', '金幣']),
  ('coin', '小額金幣，速度快', ARRAY['小額', '快速', '金幣']),
  ('character', '頂級角色，全滿裝備', ARRAY['頂級', '全滿', '稀有']),
  ('character', '高級角色，PVP專精', ARRAY['高級', 'PVP', '競技']),
  ('character', '中高級角色，PVE專精', ARRAY['中高級', 'PVE', '副本']),
  ('appearance', '稀有坐騎，限時獲取', ARRAY['稀有', '坐騎', '限時']),
  ('appearance', '絕版披風，絕版收藏', ARRAY['絕版', '披風', '收藏']),
  ('appearance', '特效武器，視覺震撼', ARRAY['特效', '武器', '華麗']),
  ('coin', '超大額金幣，優惠價', ARRAY['超大額', '優惠', '金幣']),
  ('coin', '中額金幣，穩定供應', ARRAY['中額', '穩定', '金幣']);

-- 插入角色商品數據
INSERT INTO "character_commodities" (
  "id", "commodity_id", "sect_list", "inner_skill_list", "body_type_list", "camp_list",
  "level", "info_no_debt", "info_need_change_name", "info_need_transferred", "info_need_full_level",
  "price_currency", "price_value", "image_list", "battle_rank_score", "estate_rank_score",
  "endless_battle_value_energy", "endless_battle_value_stamina", "accomplishment_score", "pet_score"
)
VALUES
  (
    1, 1, ARRAY['CHUN_YANG', 'QI_XIU']::sect_type[], 
    ARRAY['CHUN_YANG_ZI_XIA_GONG', 'QI_XIU_BING_XIN_JUE']::inner_skill_type[], 
    ARRAY['MAN']::body_type[], ARRAY['NEUTRAL']::camp_type[],
    90, true, false, false, true, 'TWD', 15000, 
    ARRAY['https://example.com/images/char1.jpg', 'https://example.com/images/char2.jpg'],
    2500, 1800, 3000, 2500, 3000, 2000
  ),
  (
    2, 2, ARRAY['SHAO_LIN']::sect_type[], 
    ARRAY['SHAO_LIN_YI_JIN_JING']::inner_skill_type[], 
    ARRAY['MAN']::body_type[], ARRAY['HAO_QI_MENG']::camp_type[],
    60, true, true, false, false, 'TWD', 5000, 
    ARRAY['https://example.com/images/char3.jpg'],
    1200, 800, 1500, 1200, 1000, 800
  ),
  (
    3, 3, ARRAY['WAN_HUA', 'MING_JIAO']::sect_type[], 
    ARRAY['WAN_HUA_HUA_JIAN_YOU', 'MING_JIAO_FEN_YING_SHENG_JUE']::inner_skill_type[], 
    ARRAY['WOMAN']::body_type[], ARRAY['E_REN_GU']::camp_type[],
    80, true, false, true, false, 'TWD', 10000, 
    ARRAY['https://example.com/images/char4.jpg', 'https://example.com/images/char5.jpg'],
    2000, 1500, 2200, 2000, 2500, 1500
  ),
  (
    8, 8, ARRAY['TANG_MEN', 'WU_DU']::sect_type[], 
    ARRAY['TANG_MEN_TIAN_LUO_GUI_DAO', 'WU_DU_DU_JING']::inner_skill_type[], 
    ARRAY['MAN']::body_type[], ARRAY['E_REN_GU']::camp_type[],
    90, true, false, false, true, 'TWD', 25000, 
    ARRAY['https://example.com/images/char6.jpg', 'https://example.com/images/char7.jpg'],
    3500, 2800, 4000, 3500, 4000, 3000
  ),
  (
    9, 9, ARRAY['CANG_JIAN', 'BA_DAO']::sect_type[], 
    ARRAY['CANG_JIAN_WEN_SHUI_JUE', 'BA_DAO_BEI_AO_JUE']::inner_skill_type[], 
    ARRAY['MAN']::body_type[], ARRAY['HAO_QI_MENG']::camp_type[],
    90, true, false, false, true, 'TWD', 18000, 
    ARRAY['https://example.com/images/char8.jpg'],
    3000, 1500, 2800, 2200, 2500, 1800
  ),
  (
    10, 10, ARRAY['PENG_LAI', 'LING_XUE']::sect_type[], 
    ARRAY['PENG_LAI_LING_HAI_JUE', 'LING_XUE_YIN_LONG_JUE']::inner_skill_type[], 
    ARRAY['WOMAN']::body_type[], ARRAY['NEUTRAL']::camp_type[],
    85, true, false, false, true, 'TWD', 12000, 
    ARRAY['https://example.com/images/char9.jpg', 'https://example.com/images/char10.jpg'],
    1800, 2800, 2500, 2000, 3200, 2500
  );

-- 插入外觀商品數據
INSERT INTO "appearance_commodities" (
  "id", "commodity_id", "name", "category", "amount", "price_currency", "price_value"
)
VALUES
  (4, 4, '龍吟天下披風', 'CLOAK', 1, 'TWD', 3000),
  (5, 5, '江湖俠客髮型', 'HAIR', 1, 'TWD', 800),
  (11, 11, '九天神龍坐騎', 'MOUNT', 1, 'TWD', 5000),
  (12, 12, '仙霧繚繞披風', 'CLOAK', 1, 'TWD', 4500),
  (13, 13, '流星追月武器特效', 'OTHER', 1, 'TWD', 2800);

-- 插入金幣商品數據
INSERT INTO "coin_commodities" (
  "id", "commodity_id", "coin_ratio_value", "coin_ratio_currency", "amount", "trans_min_limit"
)
VALUES
  (6, 6, 100, 'TWD', 1000000, 500),
  (7, 7, 120, 'TWD', 100000, 100),
  (14, 14, 95, 'TWD', 5000000, 1000),
  (15, 15, 110, 'TWD', 500000, 300);

-- 插入角色裝分數據
INSERT INTO "character_gear_scores" ("character_commodity_id", "inner_skill", "type", "score")
VALUES
  (1, 'CHUN_YANG_ZI_XIA_GONG', 'PVP', 8500),
  (1, 'CHUN_YANG_ZI_XIA_GONG', 'PVE', 9200),
  (1, 'QI_XIU_BING_XIN_JUE', 'PVP', 7800),
  (1, 'QI_XIU_BING_XIN_JUE', 'PVE', 8100),
  (2, 'SHAO_LIN_YI_JIN_JING', 'PVP', 4500),
  (2, 'SHAO_LIN_YI_JIN_JING', 'PVE', 5200),
  (3, 'WAN_HUA_HUA_JIAN_YOU', 'PVP', 6800),
  (3, 'WAN_HUA_HUA_JIAN_YOU', 'PVE', 7100),
  (3, 'MING_JIAO_FEN_YING_SHENG_JUE', 'PVP', 7200),
  (3, 'MING_JIAO_FEN_YING_SHENG_JUE', 'PVE', 7500),
  (8, 'TANG_MEN_TIAN_LUO_GUI_DAO', 'PVP', 9500),
  (8, 'TANG_MEN_TIAN_LUO_GUI_DAO', 'PVE', 9000),
  (8, 'WU_DU_DU_JING', 'PVP', 9200),
  (8, 'WU_DU_DU_JING', 'PVE', 8800),
  (9, 'CANG_JIAN_WEN_SHUI_JUE', 'PVP', 9800),
  (9, 'CANG_JIAN_WEN_SHUI_JUE', 'PVE', 7500),
  (9, 'BA_DAO_BEI_AO_JUE', 'PVP', 9600),
  (9, 'BA_DAO_BEI_AO_JUE', 'PVE', 7200),
  (10, 'PENG_LAI_LING_HAI_JUE', 'PVP', 6500),
  (10, 'PENG_LAI_LING_HAI_JUE', 'PVE', 9500),
  (10, 'LING_XUE_YIN_LONG_JUE', 'PVP', 6200),
  (10, 'LING_XUE_YIN_LONG_JUE', 'PVE', 9800);

-- 插入角色競技場分數數據
INSERT INTO "character_arena_scores" ("character_commodity_id", "type", "score")
VALUES
  (1, 'TWO_VS_TWO', 2200),
  (1, 'THREE_VS_THREE', 2350),
  (1, 'FIVE_VS_FIVE', 2500),
  (2, 'TWO_VS_TWO', 1200),
  (2, 'THREE_VS_THREE', 1350),
  (2, 'FIVE_VS_FIVE', 1500),
  (3, 'TWO_VS_TWO', 1800),
  (3, 'THREE_VS_THREE', 1950),
  (3, 'FIVE_VS_FIVE', 2100),
  (8, 'TWO_VS_TWO', 2800),
  (8, 'THREE_VS_THREE', 3000),
  (8, 'FIVE_VS_FIVE', 3200),
  (9, 'TWO_VS_TWO', 2900),
  (9, 'THREE_VS_THREE', 2800),
  (9, 'FIVE_VS_FIVE', 2750),
  (10, 'TWO_VS_TWO', 1600),
  (10, 'THREE_VS_THREE', 2100),
  (10, 'FIVE_VS_FIVE', 2400);

-- 插入角色外觀數量數據
INSERT INTO "character_skin_counts" ("character_commodity_id", "type", "value")
VALUES
  (1, 'HAIR', 12),
  (1, 'BODY', 8),
  (1, 'FACE', 5),
  (1, 'INTERACTION', 3),
  (2, 'HAIR', 3),
  (2, 'BODY', 2),
  (2, 'FACE', 1),
  (2, 'INTERACTION', 0),
  (3, 'HAIR', 8),
  (3, 'BODY', 6),
  (3, 'FACE', 4),
  (3, 'INTERACTION', 2),
  (8, 'HAIR', 18),
  (8, 'BODY', 15),
  (8, 'FACE', 10),
  (8, 'INTERACTION', 8),
  (9, 'HAIR', 14),
  (9, 'BODY', 12),
  (9, 'FACE', 8),
  (9, 'INTERACTION', 5),
  (10, 'HAIR', 10),
  (10, 'BODY', 9),
  (10, 'FACE', 7),
  (10, 'INTERACTION', 6);

-- 插入交易數據
INSERT INTO "transactions" (
  "type", "status", "methods", "commodity", "posted_by"
)
VALUES
  ('sale', 'unfinished', ARRAY['BANK_TRANSFER', 'LINE_PAY']::transaction_method_type[], 1, 1),
  ('sale', 'unfinished', ARRAY['PLAYER_TRADE', 'THIRD_PARTY_8591']::transaction_method_type[], 2, 2),
  ('sale', 'finished', ARRAY['BANK_TRANSFER']::transaction_method_type[], 3, 3),
  ('sale', 'unfinished', ARRAY['LINE_PAY', 'PAID_LETTER']::transaction_method_type[], 4, 4),
  ('sale', 'cancelled', ARRAY['PLAYER_TRADE']::transaction_method_type[], 5, 5),
  ('purchase', 'unfinished', ARRAY['BANK_TRANSFER', 'THIRD_PARTY_8591']::transaction_method_type[], 6, 1),
  ('purchase', 'finished', ARRAY['LINE_PAY']::transaction_method_type[], 7, 2),
  ('sale', 'unfinished', ARRAY['BANK_TRANSFER', 'LINE_PAY', 'THIRD_PARTY_8591']::transaction_method_type[], 8, 6),
  ('sale', 'finished', ARRAY['BANK_TRANSFER', 'LINE_PAY']::transaction_method_type[], 9, 7),
  ('sale', 'unfinished', ARRAY['PLAYER_TRADE', 'PAID_LETTER']::transaction_method_type[], 10, 8),
  ('sale', 'cancelled', ARRAY['BANK_TRANSFER']::transaction_method_type[], 11, 9),
  ('sale', 'finished', ARRAY['LINE_PAY', 'THIRD_PARTY_8591']::transaction_method_type[], 12, 10),
  ('sale', 'unfinished', ARRAY['PAID_LETTER', 'PLAYER_TRADE']::transaction_method_type[], 13, 1),
  ('purchase', 'finished', ARRAY['BANK_TRANSFER']::transaction_method_type[], 14, 2),
  ('purchase', 'unfinished', ARRAY['LINE_PAY', 'THIRD_PARTY_8591']::transaction_method_type[], 15, 3),
  ('sale', 'unfinished', ARRAY['BANK_TRANSFER', 'PAID_LETTER']::transaction_method_type[], 1, 4),
  ('sale', 'finished', ARRAY['PLAYER_TRADE']::transaction_method_type[], 2, 5),
  ('purchase', 'cancelled', ARRAY['THIRD_PARTY_8591']::transaction_method_type[], 3, 6),
  ('purchase', 'unfinished', ARRAY['BANK_TRANSFER', 'LINE_PAY']::transaction_method_type[], 4, 7),
  ('sale', 'finished', ARRAY['PAID_LETTER', 'PLAYER_TRADE', 'BANK_TRANSFER']::transaction_method_type[], 5, 8),
  ('sale', 'unfinished', ARRAY['LINE_PAY']::transaction_method_type[], 6, 9),
  ('purchase', 'finished', ARRAY['BANK_TRANSFER', 'THIRD_PARTY_8591']::transaction_method_type[], 7, 10),
  ('sale', 'cancelled', ARRAY['PLAYER_TRADE', 'PAID_LETTER']::transaction_method_type[], 8, 1),
  ('sale', 'unfinished', ARRAY['BANK_TRANSFER']::transaction_method_type[], 9, 2),
  ('purchase', 'finished', ARRAY['LINE_PAY', 'THIRD_PARTY_8591']::transaction_method_type[], 10, 3),
  ('purchase', 'unfinished', ARRAY['PAID_LETTER']::transaction_method_type[], 11, 4),
  ('sale', 'finished', ARRAY['PLAYER_TRADE', 'BANK_TRANSFER']::transaction_method_type[], 12, 5),
  ('sale', 'cancelled', ARRAY['THIRD_PARTY_8591']::transaction_method_type[], 13, 6),
  ('purchase', 'unfinished', ARRAY['BANK_TRANSFER', 'LINE_PAY', 'PAID_LETTER']::transaction_method_type[], 14, 7),
  ('purchase', 'finished', ARRAY['PLAYER_TRADE', 'THIRD_PARTY_8591']::transaction_method_type[], 15, 8);