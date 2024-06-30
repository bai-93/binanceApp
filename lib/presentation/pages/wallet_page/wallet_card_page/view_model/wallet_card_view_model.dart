import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

class WalletCardViewModel {
  List<List<Color>> gradientColos = [
    const [Color(0xff2f66f6), Color(0xff0C3FC5)],
    const [Color(0xff18181D), Color(0xff2E2E33)],
    const [Color(0xff34CA43), Color(0xff86E38F)]
  ];
  bool _isSecuredText = false;

  late final List<CardInfoModel> cardModel;

  WalletCardViewModel() {
    String imagePath = 'lib/images/wallet/cards/';
    String coinmoneyImage = 'coinmoney.png';
    String paymentImage = 'payment.png';
    String paypassImage = 'paypass.png';
    String visaImage = 'visa.png';
    cardModel = [
      CardInfoModel(
          true,
          imagePath + coinmoneyImage,
          true,
          imagePath + paypassImage,
          false,
          '',
          '',
          '1901  0330  6060  5555',
          false,
          '',
          true,
          'Card Holder',
          'Marcus Aurelius',
          true,
          'Expire 03/29',
          false,
          '',
          mainTitleColor: AppColorsUtility.surface),
      CardInfoModel(
          false,
          '',
          false,
          '',
          true,
          'monobank',
          'Universal Bank',
          '4441  1114  5050  5555',
          true,
          '05/28',
          false,
          '',
          '',
          false,
          '',
          true,
          imagePath + paymentImage,
          mainTitleColor: AppColorsUtility.surface),
      CardInfoModel(
          false,
          '',
          false,
          '',
          true,
          'monobank',
          'Universal Bank',
          '5551  4441  5050  1212',
          true,
          '05/28',
          false,
          '',
          '',
          false,
          '',
          true,
          imagePath + visaImage)
    ];
  }

  void setIsSecuredFlag() {
    _isSecuredText = !_isSecuredText;
  }

  bool getIsSecuredText() {
    return _isSecuredText;
  }

  String getTitleBalance() {
    return 'My Balance:';
  }

  String getBalanceMoney() {
    return _isSecuredText ? '******' : '\$2,670.23';
  }
}

class CardInfoModel {
  bool hasImageTopLeft;
  String imageTopLeft;
  bool hasImageTopRight;
  String imageTopRight;
  bool hasTitleTop;
  String mainTitleLefttTop;
  Color? mainTitleColor;
  String minorTitleLefttTop;
  String cardDetailsNumber;
  bool hasExpireDateUnderCardDetaillNumber;
  String expireTitleUnderCardDetailNumber;

  bool hasCardHolderBottomLeft;
  String cardHolderTitle;
  String cardHolderName;

  bool hasExpireBottomRight;
  String expireBottomRight;

  bool hasImageBottomRight;
  String imageBottomRight;

  CardInfoModel(
      this.hasImageTopLeft,
      this.imageTopLeft,
      this.hasImageTopRight,
      this.imageTopRight,
      this.hasTitleTop,
      this.mainTitleLefttTop,
      this.minorTitleLefttTop,
      this.cardDetailsNumber,
      this.hasExpireDateUnderCardDetaillNumber,
      this.expireTitleUnderCardDetailNumber,
      this.hasCardHolderBottomLeft,
      this.cardHolderTitle,
      this.cardHolderName,
      this.hasExpireBottomRight,
      this.expireBottomRight,
      this.hasImageBottomRight,
      this.imageBottomRight,
      {this.mainTitleColor = Colors.black});
}
