-- 建立發布者視圖
CREATE VIEW posters_view AS
SELECT
    p.*,
    (
        SELECT jsonb_object_agg(pc.type, pc.value)
        FROM poster_contacts pc
        WHERE pc.poster_id = p.id
    ) AS contacts
FROM posters p;

-- 建立角色商品視圖
CREATE VIEW character_commodities_view AS 
SELECT
    cc.*,
    (
        SELECT jsonb_agg(
            jsonb_build_object(
                'inner_skill', cgs.inner_skill,
                'type', cgs.type,
                'score', cgs.score
            )
        )
        FROM character_gear_scores cgs
        WHERE cgs.character_commodity_id = cc.id
    ) AS gear_scores,
    (
        SELECT jsonb_agg(
            jsonb_build_object(
                'type', cas.type,
                'score', cas.score
            )
        )
        FROM character_arena_scores cas
        WHERE cas.character_commodity_id = cc.id
    ) AS arena_scores,
    (
        SELECT jsonb_agg(
            jsonb_build_object(
                'type', csc.type,
                'value', csc.value
            )
        )
        FROM character_skin_counts csc
        WHERE csc.character_commodity_id = cc.id
    ) AS skin_counts
FROM character_commodities cc;

-- 建立商品視圖
CREATE VIEW commodities_view AS
SELECT
    c.*,
    CASE 
        WHEN c.type = 'coin'::commodity_type THEN 
            jsonb_build_object(
                'coin_ratio_value', cc.coin_ratio_value,
                'coin_ratio_currency', cc.coin_ratio_currency,
                'amount', cc.amount,
                'trans_min_limit', cc.trans_min_limit
            )
        WHEN c.type = 'appearance'::commodity_type THEN 
            jsonb_build_object(
                'name', ac.name,
                'category', ac.category,
                'amount', ac.amount,
                'price_currency', ac.price_currency,
                'price_value', ac.price_value
            )
        WHEN c.type = 'character'::commodity_type THEN 
            jsonb_build_object(
                'sect_list', ccv.sect_list,
                'inner_skill_list', ccv.inner_skill_list,
                'body_type_list', ccv.body_type_list,
                'camp_list', ccv.camp_list,
                'level', ccv.level,
                'info_no_debt', ccv.info_no_debt,
                'info_need_change_name', ccv.info_need_change_name,
                'info_need_transferred', ccv.info_need_transferred,
                'info_need_full_level', ccv.info_need_full_level,
                'price_currency', ccv.price_currency,
                'price_value', ccv.price_value,
                'image_list', ccv.image_list,
                'battle_rank_score', ccv.battle_rank_score,
                'estate_rank_score', ccv.estate_rank_score,
                'endless_battle_value_energy', ccv.endless_battle_value_energy,
                'endless_battle_value_stamina', ccv.endless_battle_value_stamina,
                'accomplishment_score', ccv.accomplishment_score,
                'pet_score', ccv.pet_score,
                'gear_scores', ccv.gear_scores,
                'arena_scores', ccv.arena_scores,
                'skin_counts', ccv.skin_counts
            )
        ELSE NULL
    END AS detail
FROM commodities c
LEFT JOIN coin_commodities cc ON cc.commodity_id = c.id AND c.type = 'coin'::commodity_type
LEFT JOIN appearance_commodities ac ON ac.commodity_id = c.id AND c.type = 'appearance'::commodity_type
LEFT JOIN character_commodities_view ccv ON ccv.commodity_id = c.id AND c.type = 'character'::commodity_type;

-- 建立交易視圖
CREATE VIEW transactions_view AS
SELECT
    t.id,
    t.order_id,
    t.token,
    t.type,
    t.status,
    t.methods,
    t.created_at,
    t.updated_at,
    (
        SELECT to_jsonb(
            jsonb_build_object(
                'id', cv.id,
                'type', cv.type,
                'remark', cv.remark,
                'tags', cv.tags,
                'detail', cv.detail
            )
        )
        FROM commodities_view cv
        WHERE cv.id = t.commodity
    ) AS commodity,
    (
        SELECT to_jsonb(
            jsonb_build_object(
                'id', pv.id,
                'nickname', pv.nickname,
                'avatar_url', pv.avatar_url,
                'game_id', pv.game_id,
                'contacts', pv.contacts
            )
        )
        FROM posters_view pv
        WHERE pv.id = t.posted_by
    ) AS posted_by
FROM transactions t;