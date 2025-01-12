import { AppearanceEnum, ContactInfoEnum, CurrencyEnum, TransactionEnum } from "@/enums";
import { AppearanceCommodity, TransactionItem } from "@/types";

export default [
  {
    id: "1",
    type: TransactionEnum.Type.SALE,
    status: TransactionEnum.Status.UNFINISHED,
    methods: [
      TransactionEnum.Method.LINE_PAY,
      TransactionEnum.Method.BANK_TRANSFER,
      TransactionEnum.Method.THIRD_PARTY_8591,
    ],
    commodity: {
      id: "1",
      type: TransactionEnum.Commodity.Coin,
      name: "歃血关山·披风",
      remark: "Remark 1",
      tags: ["Tag1", "Tag2", "Tag3"],
      amount: 6,
      price: {
        currency: CurrencyEnum.Type.TWD,
        value: 99999,
      },
      category: AppearanceEnum.Type.CLOAK,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User1",
      gameId: "GameId1",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#1234" },
        { name: ContactInfoEnum.Type.LINE, value: "0912345678" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser1" },
      ],
    },
    createdAt: 1712839503608,
    updatedAt: 1712839503608,
  },
  {
    id: "2",
    type: TransactionEnum.Type.PURCHASE,
    status: TransactionEnum.Status.FINISHED,
    methods: [TransactionEnum.Method.PLAYER_TRADE],
    commodity: {
      id: "2",
      type: TransactionEnum.Commodity.Character,
      name: "烈焰战神·头盔",
      remark: "Remark 2",
      tags: ["TagA", "TagB"],
      amount: 4,
      price: {
        currency: CurrencyEnum.Type.USD,
        value: 200,
      },
      category: AppearanceEnum.Type.COAT,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User2",
      gameId: "GameId2",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#5678" },
        { name: ContactInfoEnum.Type.LINE, value: "0987654321" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser2" },
      ],
    },
    createdAt: 1712839503609,
    updatedAt: 1712839503609,
  },
  {
    id: "3",
    type: TransactionEnum.Type.SALE,
    status: TransactionEnum.Status.CANCELLED,
    methods: [TransactionEnum.Method.BANK_TRANSFER],
    commodity: {
      id: "3",
      type: TransactionEnum.Commodity.Appearance,
      name: "暗影刺客·披风",
      remark: "Remark 3",
      tags: ["TagX", "TagY", "TagZ"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.USD,
        value: 300,
      },
      category: AppearanceEnum.Type.CLOAK,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User3",
      gameId: "GameId3",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#9101" },
        { name: ContactInfoEnum.Type.LINE, value: "0910987654" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser3" },
      ],
    },
    createdAt: 1712839503610,
    updatedAt: 1712839503610,
  },
  {
    id: "4",
    type: TransactionEnum.Type.PURCHASE,
    status: TransactionEnum.Status.UNFINISHED,
    methods: [TransactionEnum.Method.LINE_PAY],
    commodity: {
      id: "4",
      type: TransactionEnum.Commodity.Coin,
      name: "光明使者·坐骑",
      remark: "Remark 4",
      tags: ["Tag4", "Tag5"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.TWD,
        value: 400,
      },
      category: AppearanceEnum.Type.MOUNT,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User4",
      gameId: "GameId4",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#1122" },
        { name: ContactInfoEnum.Type.LINE, value: "0922334455" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser4" },
      ],
    },
    createdAt: 1712839503611,
    updatedAt: 1712839503611,
  },
  {
    id: "5",
    type: TransactionEnum.Type.SALE,
    status: TransactionEnum.Status.FINISHED,
    methods: [TransactionEnum.Method.BANK_TRANSFER],
    commodity: {
      id: "5",
      type: TransactionEnum.Commodity.Character,
      name: "烈焰战神·挂宠",
      remark: "Remark 5",
      tags: ["Tag6", "Tag7"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.USD,
        value: 500,
      },
      category: AppearanceEnum.Type.HANGING_PET,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User5",
      gameId: "GameId5",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#3344" },
        { name: ContactInfoEnum.Type.LINE, value: "0933445566" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser5" },
      ],
    },
    createdAt: 1712839503612,
    updatedAt: 1712839503612,
  },
  {
    id: "6",
    type: TransactionEnum.Type.PURCHASE,
    status: TransactionEnum.Status.CANCELLED,
    methods: [TransactionEnum.Method.THIRD_PARTY_8591],
    commodity: {
      id: "6",
      type: TransactionEnum.Commodity.Appearance,
      name: "暗夜精灵·头盔",
      remark: "Remark 6",
      tags: ["Tag8", "Tag9"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.TWD,
        value: 600,
      },
      category: AppearanceEnum.Type.COAT,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User6",
      gameId: "GameId6",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#5566" },
        { name: ContactInfoEnum.Type.LINE, value: "0944556677" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser6" },
      ],
    },
    createdAt: 1712839503613,
    updatedAt: 1712839503613,
  },
  {
    id: "7",
    type: TransactionEnum.Type.SALE,
    status: TransactionEnum.Status.UNFINISHED,
    methods: [TransactionEnum.Method.LINE_PAY, TransactionEnum.Method.BANK_TRANSFER],
    commodity: {
      id: "7",
      type: TransactionEnum.Commodity.Coin,
      name: "光明使者·披风",
      remark: "Remark 7",
      tags: ["Tag10", "Tag11"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.USD,
        value: 700,
      },
      category: AppearanceEnum.Type.CLOAK,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User7",
      gameId: "GameId7",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#7788" },
        { name: ContactInfoEnum.Type.LINE, value: "0955667788" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser7" },
      ],
    },
    createdAt: 1712839503614,
    updatedAt: 1712839503614,
  },
  {
    id: "8",
    type: TransactionEnum.Type.PURCHASE,
    status: TransactionEnum.Status.FINISHED,
    methods: [TransactionEnum.Method.PLAYER_TRADE],
    commodity: {
      id: "8",
      type: TransactionEnum.Commodity.Character,
      name: "烈焰战神·护甲",
      remark: "Remark 8",
      tags: ["Tag12", "Tag13"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.TWD,
        value: 800,
      },
      category: AppearanceEnum.Type.COAT,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User8",
      gameId: "GameId8",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#9900" },
        { name: ContactInfoEnum.Type.LINE, value: "0966778899" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser8" },
      ],
    },
    createdAt: 1712839503615,
    updatedAt: 1712839503615,
  },
  {
    id: "9",
    type: TransactionEnum.Type.SALE,
    status: TransactionEnum.Status.CANCELLED,
    methods: [TransactionEnum.Method.BANK_TRANSFER],
    commodity: {
      id: "9",
      type: TransactionEnum.Commodity.Appearance,
      name: "暗影刺客·坐骑",
      remark: "Remark 9",
      tags: ["Tag14", "Tag15"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.USD,
        value: 900,
      },
      category: AppearanceEnum.Type.MOUNT,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User9",
      gameId: "GameId9",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#1122" },
        { name: ContactInfoEnum.Type.LINE, value: "0977889900" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser9" },
      ],
    },
    createdAt: 1712839503616,
    updatedAt: 1712839503616,
  },
  {
    id: "10",
    type: TransactionEnum.Type.PURCHASE,
    status: TransactionEnum.Status.UNFINISHED,
    methods: [TransactionEnum.Method.LINE_PAY, TransactionEnum.Method.PLAYER_TRADE],
    commodity: {
      id: "10",
      type: TransactionEnum.Commodity.Coin,
      name: "光明使者·头盔",
      remark: "Remark 10",
      tags: ["Tag16", "Tag17"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.TWD,
        value: 1000,
      },
      category: AppearanceEnum.Type.COAT,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User10",
      gameId: "GameId10",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#3344" },
        { name: ContactInfoEnum.Type.LINE, value: "0999001122" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser10" },
      ],
    },
    createdAt: 1712839503617,
    updatedAt: 1712839503617,
  },
  {
    id: "11",
    type: TransactionEnum.Type.SALE,
    status: TransactionEnum.Status.FINISHED,
    methods: [TransactionEnum.Method.LINE_PAY],
    commodity: {
      id: "11",
      type: TransactionEnum.Commodity.Character,
      name: "暗夜精灵·披风",
      remark: "Remark 11",
      tags: ["Tag18", "Tag19"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.USD,
        value: 1100,
      },
      category: AppearanceEnum.Type.CLOAK,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User11",
      gameId: "GameId11",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#5566" },
        { name: ContactInfoEnum.Type.LINE, value: "0911223344" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser11" },
      ],
    },
    createdAt: 1712839503618,
    updatedAt: 1712839503618,
  },
  {
    id: "12",
    type: TransactionEnum.Type.PURCHASE,
    status: TransactionEnum.Status.CANCELLED,
    methods: [TransactionEnum.Method.PLAYER_TRADE, TransactionEnum.Method.BANK_TRANSFER],
    commodity: {
      id: "12",
      type: TransactionEnum.Commodity.Appearance,
      name: "烈焰战神·战靴",
      remark: "Remark 12",
      tags: ["Tag20", "Tag21"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.USD,
        value: 1200,
      },
      category: AppearanceEnum.Type.OTHER,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User12",
      gameId: "GameId12",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#7788" },
        { name: ContactInfoEnum.Type.LINE, value: "0922334455" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser12" },
      ],
    },
    createdAt: 1712839503619,
    updatedAt: 1712839503619,
  },
  {
    id: "13",
    type: TransactionEnum.Type.SALE,
    status: TransactionEnum.Status.UNFINISHED,
    methods: [TransactionEnum.Method.LINE_PAY],
    commodity: {
      id: "13",
      type: TransactionEnum.Commodity.Coin,
      name: "光明使者·马具",
      remark: "Remark 13",
      tags: ["Tag22", "Tag23"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.TWD,
        value: 1300,
      },
      category: AppearanceEnum.Type.HARNESS,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User13",
      gameId: "GameId13",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#9900" },
        { name: ContactInfoEnum.Type.LINE, value: "0933445566" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser13" },
      ],
    },
    createdAt: 1712839503620,
    updatedAt: 1712839503620,
  },
  {
    id: "14",
    type: TransactionEnum.Type.PURCHASE,
    status: TransactionEnum.Status.FINISHED,
    methods: [TransactionEnum.Method.BANK_TRANSFER],
    commodity: {
      id: "14",
      type: TransactionEnum.Commodity.Character,
      name: "暗影刺客·礼盒",
      remark: "Remark 14",
      tags: ["Tag24", "Tag25"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.USD,
        value: 1400,
      },
      category: AppearanceEnum.Type.GIFT_BOX,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User14",
      gameId: "GameId14",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#1122" },
        { name: ContactInfoEnum.Type.LINE, value: "0944556677" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser14" },
      ],
    },
    createdAt: 1712839503621,
    updatedAt: 1712839503621,
  },
  {
    id: "15",
    type: TransactionEnum.Type.SALE,
    status: TransactionEnum.Status.CANCELLED,
    methods: [TransactionEnum.Method.THIRD_PARTY_8591],
    commodity: {
      id: "15",
      type: TransactionEnum.Commodity.Appearance,
      name: "烈焰战神·髮型",
      remark: "Remark 15",
      tags: ["Tag26", "Tag27"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.TWD,
        value: 1500,
      },
      category: AppearanceEnum.Type.HAIR,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User15",
      gameId: "GameId15",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#3344" },
        { name: ContactInfoEnum.Type.LINE, value: "0955667788" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser15" },
      ],
    },
    createdAt: 1712839503622,
    updatedAt: 1712839503622,
  },
  {
    id: "16",
    type: TransactionEnum.Type.PURCHASE,
    status: TransactionEnum.Status.UNFINISHED,
    methods: [TransactionEnum.Method.LINE_PAY, TransactionEnum.Method.BANK_TRANSFER],
    commodity: {
      id: "16",
      type: TransactionEnum.Commodity.Coin,
      name: "光明使者·披风",
      remark: "Remark 16",
      tags: ["Tag28", "Tag29"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.USD,
        value: 1600,
      },
      category: AppearanceEnum.Type.CLOAK,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User16",
      gameId: "GameId16",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#5566" },
        { name: ContactInfoEnum.Type.LINE, value: "0966778899" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser16" },
      ],
    },
    createdAt: 1712839503623,
    updatedAt: 1712839503623,
  },
  {
    id: "17",
    type: TransactionEnum.Type.SALE,
    status: TransactionEnum.Status.FINISHED,
    methods: [TransactionEnum.Method.PLAYER_TRADE],
    commodity: {
      id: "17",
      type: TransactionEnum.Commodity.Character,
      name: "暗夜精灵·挂宠",
      remark: "Remark 17",
      tags: ["Tag30", "Tag31"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.TWD,
        value: 1700,
      },
      category: AppearanceEnum.Type.HANGING_PET,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User17",
      gameId: "GameId17",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#7788" },
        { name: ContactInfoEnum.Type.LINE, value: "0977889900" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser17" },
      ],
    },
    createdAt: 1712839503624,
    updatedAt: 1712839503624,
  },
  {
    id: "18",
    type: TransactionEnum.Type.PURCHASE,
    status: TransactionEnum.Status.CANCELLED,
    methods: [TransactionEnum.Method.BANK_TRANSFER],
    commodity: {
      id: "18",
      type: TransactionEnum.Commodity.Appearance,
      name: "烈焰战神·披风",
      remark: "Remark 18",
      tags: ["Tag32", "Tag33"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.USD,
        value: 1800,
      },
      category: AppearanceEnum.Type.CLOAK,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User18",
      gameId: "GameId18",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#9900" },
        { name: ContactInfoEnum.Type.LINE, value: "0988990011" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser18" },
      ],
    },
    createdAt: 1712839503625,
    updatedAt: 1712839503625,
  },
  {
    id: "19",
    type: TransactionEnum.Type.SALE,
    status: TransactionEnum.Status.UNFINISHED,
    methods: [TransactionEnum.Method.LINE_PAY, TransactionEnum.Method.PLAYER_TRADE],
    commodity: {
      id: "19",
      type: TransactionEnum.Commodity.Coin,
      name: "光明使者·盔甲",
      remark: "Remark 19",
      tags: ["Tag34", "Tag35"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.USD,
        value: 1900,
      },
      category: AppearanceEnum.Type.COAT,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User19",
      gameId: "GameId19",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#4455" },
        { name: ContactInfoEnum.Type.LINE, value: "0999001122" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser19" },
      ],
    },
    createdAt: 1712839503626,
    updatedAt: 1712839503626,
  },
  {
    id: "20",
    type: TransactionEnum.Type.PURCHASE,
    status: TransactionEnum.Status.FINISHED,
    methods: [TransactionEnum.Method.PLAYER_TRADE],
    commodity: {
      id: "20",
      type: TransactionEnum.Commodity.Character,
      name: "烈焰战神·披风",
      remark: "Remark 20",
      tags: ["Tag36", "Tag37"],
      amount: 2,
      price: {
        currency: CurrencyEnum.Type.USD,
        value: 2000,
      },
      category: AppearanceEnum.Type.CLOAK,
    },
    postedBy: {
      avatarUrl: "https://i.pravatar.cc/300?img=5",
      nickname: "User20",
      gameId: "GameId20",
      contacts: [
        { name: ContactInfoEnum.Type.DISCORD, value: "#5566" },
        { name: ContactInfoEnum.Type.LINE, value: "0911223344" },
        { name: ContactInfoEnum.Type.FACEBOOK, value: "FBUser20" },
      ],
    },
    createdAt: 1712839503627,
    updatedAt: 1712839503627,
  },
] as TransactionItem<AppearanceCommodity>[];
