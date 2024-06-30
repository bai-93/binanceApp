import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

class WalletViewModel {
  int _cardIndex = 0;
  int _slidingIndex = 0;

  void setSlideIndex(int index) {
    _slidingIndex = index;
  }

  int getSlideIndex() {
    return _slidingIndex;
  }

  void setCardIndex(int index) {
    _cardIndex = index;
  }

  int getCardIndex() {
    return _cardIndex;
  }

  List<String> getFinanceButtonTitles() {
    return ['Deposit', 'Send', 'Receive', 'Withdraw'];
  }

  List<String> getImagePath() {
    String imagePath = 'lib/images/wallet/';
    return [
      '${imagePath}deposit.png',
      '${imagePath}send.png',
      '${imagePath}receive.png',
      '${imagePath}withdraw.png'
    ];
  }

  void depositTapped() {
    debugPrint('deposit');
  }

  void sendTapped() {
    debugPrint('send');
  }

  void receiveTapped() {
    debugPrint('receive');
  }

  void withdrawTapped() {
    debugPrint('withdraw');
  }

  Map<int, Widget> makeSlidingItems(BuildContext context) {
    List<String> slidingData = ['Cards', 'Portfolio'];
    TextStyle? textStyle;
    Map<int, Widget> dataWidgets = {};
    for (int i = 0; i < slidingData.length; i++) {
      if (i == _slidingIndex) {
        dataWidgets[i] =
            Text(slidingData[i], style: Theme.of(context).textTheme.bodySmall);
      } else {
        textStyle = TextStyle(
            color: AppColorsUtility.secondary,
            fontSize: 14.0,
            fontWeight: FontWeight.w400);
        dataWidgets[i] = Text(slidingData[i], style: textStyle);
      }
    }
    return dataWidgets;
  }
}
