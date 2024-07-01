import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

class WalletDraggableViewModel {
  List<String> dateOfOperations = ['15.06.2022', '14.06.2022'];
  late List<FinanceOperationsInfo> firstPartTransaction;
  late List<FinanceOperationsInfo> secondPartTransaction;

  WalletDraggableViewModel() {
    const String imageBrandPath = 'lib/images/brand/';
    const String imageWalletPath = 'lib/images/wallet/';
    firstPartTransaction = [
      FinanceOperationsInfo('${imageBrandPath}apple.png', 'Apple', '-8.99\$'),
      FinanceOperationsInfo(
          '${imageBrandPath}netflix.png', 'Netflix', '-12.99\$'),
      FinanceOperationsInfo(
          '${imageWalletPath}deposit.png', 'Deposit', '+\$2,000.00',
          subtitlePayInfo: 'Cryptocurrency',
          colorOfMoneyValue: AppColorsUtility.green),
      FinanceOperationsInfo('${imageWalletPath}send.png', 'Send', '-\$5,000.00',
          subtitlePayInfo: 'monobank')
    ];

    secondPartTransaction = [
      FinanceOperationsInfo(
          '${imageBrandPath}paypal.png', 'PayPal', '+\$2,990.00',
          subtitlePayInfo: 'monobank',
          colorOfMoneyValue: AppColorsUtility.green),
      FinanceOperationsInfo('${imageBrandPath}aura.png', 'Aura', '-\$50.00',
          subtitlePayInfo: 'shopping'),
      FinanceOperationsInfo(
          '${imageBrandPath}youtube.png', 'You Tube', '-12.99\$'),
      FinanceOperationsInfo('${imageBrandPath}uber.png', 'Uber', '-52.99\$',
          subtitlePayInfo: 'Taxi'),
    ];
  }
}

class FinanceOperationsInfo {
  String imagePath;
  String titleOfPayInfo;
  String subtitlePayInfo;
  String moneyValue;
  Color? colorOfMoneyValue;

  FinanceOperationsInfo(this.imagePath, this.titleOfPayInfo, this.moneyValue,
      {this.subtitlePayInfo = 'Payment for subscription',
      this.colorOfMoneyValue});
}
