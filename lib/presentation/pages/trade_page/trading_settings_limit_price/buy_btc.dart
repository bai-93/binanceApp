import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/presentation/pages/trade_page/trading_settings_limit_price/buy_btc_model.dart';
import 'package:sheker/uicomponent/slider/custom_slider.dart';
import 'package:sheker/utilities/app_colors.dart';

class BuyBtcPriceLimit extends StatefulWidget {
  const BuyBtcPriceLimit({super.key});

  @override
  State<BuyBtcPriceLimit> createState() => _BuyBtcPriceLimitState();
}

class _BuyBtcPriceLimitState extends State<BuyBtcPriceLimit> {
  bool flagDropDown = false;
  final MenuController _controller = MenuController();
  List<String> dropDownData = ['Limit', 'Market', 'Stop Limit', 'Stop Loss'];
  String dropDownTitle = 'Limit';
  BuyBtcModel model = BuyBtcModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        makeDropdown(),
        const SizedBox(
          height: 8.0,
        ),
        makeText('Available:', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(
          height: 4.0,
        ),
        makeText(model.getUSDTString(),
            style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(
          height: 24.0,
        ),
        makePriceOrBTCButton(() {
          setState(() {
            model.onMinusTap();
          });
        }, () {
          setState(() {
            model.onPlusTap();
          });
        }),
        const SizedBox(
          height: 8.0,
        ),
        makePriceOrBTCButton(isBtc: true, () {
          setState(() {
            model.onMinusCoinTap();
          });
        }, () {
          setState(() {
            model.onPlusCoinTap();
          });
        }),
        const SizedBox(
          height: 16.0,
        ),
        SizedBox(
          height: 11.0,
          width: 170.0,
          child: CustomSlider(
            model.getPercentOfSlider(),
            (value) {
              setState(() {
                model.changePercentOfSlider(value);
              });
            },
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        makeCoinContainer(),
        const SizedBox(
          height: 16.0,
        ),
        makeButton(() {
          debugPrint('BUY button');
        }),
      ],
    );
  }

  Widget makeCoinContainer() {
    return Container(
      height: 32.0,
      width: 165.0,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(Radius.circular(7.0)),
          boxShadow: [
            BoxShadow(
                color: AppColorsUtility.internalShadow,
                spreadRadius: 0.0,
                blurRadius: 4.0,
                offset: const Offset(0.0, 4.0))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
            child: Text(
              model.getPercentOfPrice(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
            child: Text(
              'USDT',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }

  Widget makeText(String text,
      {TextStyle? style, Color? color, double? fontSize}) {
    return Text(
      text,
      style: style ?? TextStyle(color: color, fontSize: fontSize),
    );
  }

  Widget makeButton(Function() onPressed) {
    return SizedBox(
        height: 48.0,
        width: 170.0,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColorsUtility.onboardingPrimary),
          child: Text(
            'BUY ${model.getTitleOfPriceBTC(true)}',
            style: const TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ));
  }

  Widget makePriceOrBTCButton(Function() onMinusTap, Function() onPlusTap,
      {bool isBtc = false}) {
    String title = model.getTitleOfPriceBTC(isBtc);
    return Container(
      height: 32.0,
      width: 170.0,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(Radius.circular(7.0)),
          boxShadow: [
            BoxShadow(
                color: AppColorsUtility.internalShadow,
                blurRadius: 4.0,
                spreadRadius: 0.0,
                offset: const Offset(0.0, 4.0))
          ]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
            child: GestureDetector(
              onTap: onMinusTap,
              child: SizedBox(
                height: 16.0,
                width: 16.0,
                child: Image.asset('lib/images/trade/minus.png'),
              ),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            model.getCurrentValuePriceOrCoin(isBtc),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, right: 8.0, left: 8.0, bottom: 8.0),
            child: GestureDetector(
              onTap: onPlusTap,
              child: SizedBox(
                  height: 16.0,
                  width: 16.0,
                  child: Image.asset('lib/images/trade/plus.png')),
            ),
          )
        ],
      ),
    );
  }

  Widget makeDropdown() {
    return MenuAnchor(
      menuChildren: dropDownData.map<Widget>((String value) {
        return GestureDetector(
          onTap: () {
            setState(() {
              flagDropDown = false;
              dropDownTitle = dropDownData[dropDownData.indexOf(value)];
            });
            _controller.close();
          },
          child: Container(
            height: 32.0,
            width: 170,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        );
      }).toList(),
      style: MenuStyle(
          backgroundColor:
              WidgetStatePropertyAll(Theme.of(context).colorScheme.surface)),
      controller: _controller,
      onOpen: () {
        setState(() {
          flagDropDown = true;
        });
      },
      onClose: () {
        setState(() {
          _controller.close();
          flagDropDown = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          _controller.open(position: const Offset(0.0, 40.0));
        },
        child: Container(
            height: 32.0,
            width: 170,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                      color: AppColorsUtility.internalShadow,
                      offset: const Offset(0.0, 3.0),
                      blurRadius: 4.0,
                      spreadRadius: 0.0)
                ],
                borderRadius: const BorderRadius.all(Radius.circular(7.0))),
            child: Row(
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  dropDownTitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                Icon(flagDropDown
                    ? Icons.arrow_drop_up_rounded
                    : Icons.arrow_drop_down_rounded),
                const SizedBox(
                  width: 10.0,
                )
              ],
            )),
      ),
    );
  }
}
