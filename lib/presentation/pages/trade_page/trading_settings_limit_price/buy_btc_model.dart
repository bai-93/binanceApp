class BuyBtcModel {
  double _USDT = 1000;
  double currentValue = 0.0;
  double _percentOfSlider = 0;
  double coinValue = 0.0;

  void setUSDT(double value) {
    _USDT = value;
  }

  void changePercentOfSlider(double value) {
    // print("value haved just changed === $value");
    _percentOfSlider = value;
  }

  double getUSDT() {
    return _USDT;
  }

  String getUSDTString() {
    String data = (_USDT - currentValue).toString();
    return '$data USDT';
  }

  double getPercentOfSlider() {
    return _percentOfSlider;
  }

  String getPercentOfPrice() {
    return (_percentOfSlider * _USDT).toInt().toString();
  }

  String getPercentOfSliderString() {
    return '$_percentOfSlider %';
  }

  String getTitleOfPriceBTC(bool isBTC) {
    return isBTC ? 'BTC' : 'USDT';
  }

  String getCurrentValuePriceOrCoin(bool isCoin) {
    return isCoin ? coinValue.toString() : currentValue.toString();
  }

  void onMinusTap() {
    if (currentValue != 0) {
      currentValue -= 1.0;
    }
  }

  void onPlusTap() {
    if (_USDT != currentValue && currentValue < _USDT) {
      currentValue += 1.0;
    }
  }

  void onMinusCoinTap() {
    if (coinValue != 0.0) {
      coinValue -= 1.0;
    }
  }

  void onPlusCoinTap() {
    coinValue += 1.0;
  }
}
