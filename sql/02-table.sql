-- 安裝 trgm 模組
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- 發布者
CREATE TABLE "posters" (
  "id" uuid PRIMARY KEY,
  "nickname" varchar NOT NULL,
  "avatar_url" varchar,
  "game_id" varchar NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);
CREATE UNIQUE INDEX "idx_posters" ON "posters" ("game_id", "nickname");

-- 發布者-聯絡方式
CREATE TABLE "poster_contacts" (
  "id" uuid PRIMARY KEY,
  "poster_id" uuid NOT NULL,
  "type" contact_type NOT NULL,
  "value" varchar NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);
CREATE UNIQUE INDEX "idx_poster_contacts" ON "poster_contacts" ("poster_id", "type");
ALTER TABLE "poster_contacts" ADD FOREIGN KEY ("poster_id") REFERENCES "posters" ("id");

-- 商品
CREATE TABLE "commodities" (
  "id" integer PRIMARY KEY,
  "type" transaction_commodities NOT NULL,
  "remark" text,
  "tags" varchar[],
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);
CREATE INDEX "idx_commodities" ON "commodities" ("id", "type");

-- 商品-金幣
CREATE TABLE "coin_commodities" (
  "id" integer PRIMARY KEY,
  "coin_ratio_value" decimal NOT NULL,
  "coin_ratio_currency" currency_type NOT NULL,
  "amount" decimal NOT NULL,
  "trans_min_limit" integer NOT NULL
) INHERITS (commodities);
CREATE INDEX "idx_coin_commodities" ON "coin_commodities" ("id", "coin_ratio_currency", "coin_ratio_value", "amount");
ALTER TABLE "coin_commodities" ADD FOREIGN KEY ("id") REFERENCES "commodities" ("id");

-- 商品-外觀
CREATE TABLE "appearance_commodities" (
  "id" integer PRIMARY KEY,
  "name" varchar NOT NULL,
  "category" appearance_type NOT NULL,
  "amount" integer NOT NULL,
  "price_currency" currency_type NOT NULL,
  "price_value" decimal NOT NULL
) INHERITS (commodities);
CREATE INDEX "idx_appearance_commodities_name" ON "appearance_commodities" USING GIN ("name" gin_trgm_ops);
CREATE INDEX "idx_appearance_commodities" ON "appearance_commodities" ("id", "category", "name", "price_currency", "price_value");
ALTER TABLE "appearance_commodities" ADD FOREIGN KEY ("id") REFERENCES "commodities" ("id");

-- 商品-角色
CREATE TABLE "character_commodities" (
  "id" integer PRIMARY KEY,
  "sect_list" sect_type[] NOT NULL,
  "inner_skill_list" inner_skill_type[] NOT NULL,
  "body_type_list" body_type[] NOT NULL,
  "camp_list" camp_type[] NOT NULL,
  "level" integer NOT NULL,
  "info_no_debt" boolean NOT NULL,
  "info_need_change_name" boolean NOT NULL,
  "info_need_transferred" boolean NOT NULL,
  "info_need_full_level" boolean NOT NULL,
  "price_currency" currency_type NOT NULL,
  "price_value" integer NOT NULL,
  "image_list" varchar[],
  "battle_rank_score" integer,
  "estate_rank_score" integer,
  "endless_battle_value_energy" integer,
  "endless_battle_value_stamina" integer,
  "accomplishment_score" integer,
  "pet_score" integer
) INHERITS (commodities);
CREATE INDEX "idx_character_commodities" ON "character_commodities" ("id", "sect_list", "inner_skill_list", "body_type_list", "camp_list", "accomplishment_score", "price_currency", "price_value");
ALTER TABLE "character_commodities" ADD FOREIGN KEY ("id") REFERENCES "commodities" ("id");

-- 商品-角色-裝分
CREATE TABLE "character_gear_scores" (
  "id" integer PRIMARY KEY,
  "character_commodity_id" integer NOT NULL,
  "inner_skill" inner_skill_type,
  "type" gear_type NOT NULL,
  "score" integer,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);
CREATE UNIQUE INDEX ON "character_gear_scores" ("character_commodity_id", "inner_skill", "type");
ALTER TABLE "character_gear_scores" ADD FOREIGN KEY ("character_commodity_id") REFERENCES "character_commodities" ("id");

-- 商品-角色-競技場分數
CREATE TABLE "character_arena_scores" (
  "id" integer PRIMARY KEY,
  "character_commodity_id" integer NOT NULL,
  "type" arena_type NOT NULL,
  "score" integer,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);
CREATE UNIQUE INDEX ON "character_arena_scores" ("character_commodity_id", "type");
ALTER TABLE "character_arena_scores" ADD FOREIGN KEY ("character_commodity_id") REFERENCES "character_commodities" ("id");

-- 商品-角色-外觀數量
CREATE TABLE "character_skin_counts" (
  "id" integer PRIMARY KEY,
  "character_commodity_id" integer NOT NULL,
  "type" skin_type NOT NULL,
  "value" integer,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);
CREATE UNIQUE INDEX ON "character_skin_counts" ("character_commodity_id", "type");
ALTER TABLE "character_skin_counts" ADD FOREIGN KEY ("character_commodity_id") REFERENCES "character_commodities" ("id");

-- 交易
CREATE TABLE "transactions" (
  "id" integer PRIMARY KEY,
  "order_id" varchar(20) UNIQUE NOT NULL,
  "token" uuid UNIQUE NOT NULL,
  "type" transaction_types NOT NULL,
  "status" transaction_status NOT NULL,
  "methods" transaction_methods[] NOT NULL,
  "commodity" integer NOT NULL,
  "postedBy" uuid NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);
CREATE INDEX "idx_transactions_token" ON "transactions" ("token");
CREATE INDEX "idx_transactions_methods" ON "transactions" USING GIN ("methods");
CREATE INDEX "idx_transactions" ON "transactions" ("type", "status", "commodity", "postedBy", "created_at", "updated_at");
ALTER TABLE "transactions" ADD FOREIGN KEY ("commodity") REFERENCES "commodities" ("id");
ALTER TABLE "transactions" ADD FOREIGN KEY ("postedBy") REFERENCES "posters" ("id");