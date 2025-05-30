-- 聯絡類型
CREATE TYPE "contact_type" AS ENUM (
  'LINE',
  'DISCORD',
  'FACEBOOK',
  'PRIVATE_MESSAGE'
);

-- 體型類型
CREATE TYPE "body_type" AS ENUM (
  'MAN',
  'WOMAN',
  'BOY',
  'GIRL'
);

-- 陣營類型
CREATE TYPE "camp_type" AS ENUM (
  'NEUTRAL',
  'HAO_QI_MENG',
  'E_REN_GU'
);

-- 競技場類型
CREATE TYPE "arena_type" AS ENUM (
  'TWO_VS_TWO',
  'THREE_VS_THREE',
  'FIVE_VS_FIVE'
);

-- 角色外觀類型
CREATE TYPE "skin_type" AS ENUM (
  'HAIR',
  'BODY',
  'FACE',
  'INTERACTION'
);

-- 裝備類型
CREATE TYPE "gear_type" AS ENUM (
  'PVP',
  'PVE'
);

-- 門派類型
CREATE TYPE "sect_type" AS ENUM (
  'DA_XIA',
  'CHUN_YANG',
  'QI_XIU',
  'WAN_HUA',
  'SHAO_LIN',
  'TIAN_CE',
  'CANG_JIAN',
  'WU_DU',
  'TANG_MEN',
  'MING_JIAO',
  'GAI_BANG',
  'CANG_YUN',
  'CHANG_GE',
  'BA_DAO',
  'PENG_LAI',
  'LING_XUE',
  'YAN_TIAN',
  'YAO_ZONG',
  'DAO_ZONG',
  'WAN_LING'
);

-- 內功類型
CREATE TYPE "inner_skill_type" AS ENUM (
  'QI_XIU_BING_XIN_JUE',
  'QI_XIU_YUN_SHANG_XIN_JING',
  'WAN_HUA_HUA_JIAN_YOU',
  'WAN_HUA_LI_JING_YI_DAO',
  'WU_DU_DU_JING',
  'WU_DU_BU_TIAN_JUE',
  'CHANG_GE_MO_WEN',
  'CHANG_GE_XIANG_ZHI',
  'YAO_ZONG_WU_FANG',
  'YAO_ZONG_LING_SU',
  'TIAN_CE_AO_XUE_ZHAN_YI',
  'TIAN_CE_TIE_LAO_LV',
  'SHAO_LIN_YI_JIN_JING',
  'SHAO_LIN_XI_SUI_JING',
  'MING_JIAO_FEN_YING_SHENG_JUE',
  'MING_JIAO_MING_ZUN_LIU_LI_TI',
  'CANG_YUN_FEN_SHAN_JIN',
  'CANG_YUN_TIE_GU_YI',
  'CHUN_YANG_ZI_XIA_GONG',
  'CHUN_YANG_TAI_XU_JIAN_YI',
  'TANG_MEN_TIAN_LUO_GUI_DAO',
  'TANG_MEN_JING_YU_JUE',
  'CANG_JIAN_WEN_SHUI_JUE',
  'GAI_BANG_XIAO_CHEN_JUE',
  'BA_DAO_BEI_AO_JUE',
  'PENG_LAI_LING_HAI_JUE',
  'LING_XUE_YIN_LONG_JUE',
  'YAN_TIAN_TAI_XUAN_JING',
  'DAO_ZONG_GU_FENG_JUE',
  'WAN_LING_SHAN_HAI_XIN_JUE'
);

-- 外觀類型
CREATE TYPE "appearance_type" AS ENUM (
  'GIFT_BOX',
  'CLOAK',
  'COAT',
  'HAIR',
  'HARNESS',
  'MOUNT',
  'HANGING_PET',
  'OTHER'
);

-- 幣種類型
CREATE TYPE "currency_type" AS ENUM (
  'COIN',
  'TWD',
  'USD',
  'VND'
);

-- 交易類型
CREATE TYPE "transaction_type" AS ENUM (
  'sale',
  'purchase'
);

-- 交易狀態類型
CREATE TYPE "transaction_status_type" AS ENUM (
  'unfinished',
  'finished',
  'cancelled'
);

-- 商品類型
CREATE TYPE "commodity_type" AS ENUM (
  'appearance',
  'character',
  'coin'
);

-- 交易方式類型
CREATE TYPE "transaction_method_type" AS ENUM (
  'PAID_LETTER',
  'PLAYER_TRADE',
  'BANK_TRANSFER',
  'LINE_PAY',
  'THIRD_PARTY_8591'
);