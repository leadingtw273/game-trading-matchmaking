import dayjs from "dayjs";
import { Col, Flex, Row, Tag } from "antd";

import CoatImage from "@/assets/icon/appearance/coat.svg";
import GiftBoxImage from "@/assets/icon/appearance/giftBox.svg";
import HairImage from "@/assets/icon/appearance/hair.svg";
import HangingPetImage from "@/assets/icon/appearance/hangingPet.svg";
import HarnessImage from "@/assets/icon/appearance/harness.svg";
import MountImage from "@/assets/icon/appearance/mount.svg";
import OtherImage from "@/assets/icon/appearance/other.svg";
import { AppearanceConst, ContactInfoConst, CurrencyConst, TransactionConst } from "@/consts";
import { AppearanceEnum, TransactionEnum } from "@/enums";
import { AppearanceCommodity, TransactionItem } from "@/types";
import { getOptionsLabel } from "@/utils";

import "./style.scss";

type CommodityContentProps = {
  transactionType: TransactionEnum.Type;
  item: TransactionItem<AppearanceCommodity>;
};
export default function CommodityContent(props: CommodityContentProps) {
  const { transactionType, item } = props;
  const { commodity } = item;
  const isSale = transactionType === TransactionEnum.Type.SALE;
  const currencyFormatter = new Intl.NumberFormat("zh-TW").format;

  const categoryImageMap = {
    [AppearanceEnum.Type.GIFT_BOX]: GiftBoxImage,
    [AppearanceEnum.Type.CLOAK]: CoatImage,
    [AppearanceEnum.Type.COAT]: CoatImage,
    [AppearanceEnum.Type.HAIR]: HairImage,
    [AppearanceEnum.Type.HARNESS]: HarnessImage,
    [AppearanceEnum.Type.MOUNT]: MountImage,
    [AppearanceEnum.Type.HANGING_PET]: HangingPetImage,
    [AppearanceEnum.Type.OTHER]: OtherImage,
  };

  return (
    <div className="appearance list-content">
      <div className="list-content__main">
        <img className="image" src={categoryImageMap[commodity.category]} />
        <div className="content">
          <div className="content__tip">{isSale ? "販賣" : "收購"}金幣</div>
          <div className="content__name">{commodity.name}</div>
        </div>
      </div>
      <div className="list-content__content">
        <Flex gap={25} className="info">
          <div className="info__column">
            <Flex gap={8}>
              <span className="label">類型</span>
              <span className="value">{getOptionsLabel(commodity.category, AppearanceConst.getTypeOptions())}</span>
            </Flex>
            <Flex gap={8}>
              <span className="label">{isSale ? "庫存數量" : "需求數量"}</span>
              <span className="value">{commodity.amount}</span>
            </Flex>
            <Flex gap={8}>
              <span className="label">交易方式</span>
              <span className="value split-dot">
                {item.methods.map((method) => (
                  <span key={method}>{getOptionsLabel(method, TransactionConst.getMethodOptions())}</span>
                ))}
              </span>
            </Flex>
          </div>
          <div className="info__column">
            <Flex gap={8}>
              <span className="label">{isSale ? "賣家" : "買家"}</span>
              <span className="value">{item.postedBy.nickname}</span>
            </Flex>
            <Flex gap={8}>
              <span className="label">聯絡方式</span>
              <span className="value split-dot">
                {item.postedBy.contacts.map(({ name }) => (
                  <span key={name}>{getOptionsLabel(name, ContactInfoConst.getTypeOptions())}</span>
                ))}
              </span>
            </Flex>
            <Flex gap={8}>
              <span className="label">更新時間</span>
              <span className="value">{dayjs(item.updatedAt).format("YYYY/MM/DD")}</span>
            </Flex>
          </div>
        </Flex>
        <Row className="tags" gutter={[4, 4]}>
          {commodity.tags.map((tag) => (
            <Col key={tag}>
              <Tag>{tag}</Tag>
            </Col>
          ))}
        </Row>
      </div>

      <div className="list-content__prize">
        <div className="currency">{getOptionsLabel(commodity.price.currency, CurrencyConst.getTypeOptions())}</div>
        <div className="amount">{currencyFormatter(commodity.price.value)}</div>
      </div>
    </div>
  );
}
