import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/trade_page/orders/orders_content.dart';
import 'package:sheker/presentation/pages/trade_page/orders/orders_view_model.dart';
import 'package:sheker/utilities/app_colors.dart';

class OrdersMain extends StatefulWidget {
  const OrdersMain({super.key});

  @override
  State<OrdersMain> createState() => _OrdersMainState();
}

class _OrdersMainState extends State<OrdersMain> {
  OrdersViewModel model = OrdersViewModel();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24.0,
        ),
        Row(
          children: [
            makeTitleText('Open Orders',
                style: Theme.of(context).textTheme.labelMedium),
            const Spacer(),
            makeTitleText('More', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(
          height: 18.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 24.0,
              width: 24.0,
              decoration: BoxDecoration(
                  color: model.getFilledColor(),
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  boxShadow: const [
                    BoxShadow(blurRadius: 0.1, spreadRadius: 0.02)
                  ]),
              child: Checkbox(
                  checkColor: Theme.of(context).colorScheme.surface,
                  side: BorderSide(color: model.getFilledColor(), width: 0.0),
                  value: model.getIsHide(),
                  splashRadius: 0.0,
                  fillColor: WidgetStatePropertyAll(model.getFilledColor()),
                  onChanged: (value) {
                    setState(() {
                      model.changeHide(value ?? false);
                    });
                  }),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              'Hide Other Pairs',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Spacer(),
            makeCancellButton(),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        OrderContent(model.getIsHide(), model.data, model.price, model.amount)
      ],
    );
  }

  Widget makeCancellButton() {
    return GestureDetector(
      onTap: () {
        debugPrint('cancell button action');
      },
      child: Container(
        height: 28.0,
        width: 80.0,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: AppColorsUtility.internalShadow,
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  offset: const Offset(0.0, 4.0))
            ],
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        child: Center(
          child: Text(
            'Cancell all',
            style: TextStyle(
                color: AppColorsUtility.secondary,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  Widget makeTitleText(String title, {TextStyle? style}) {
    return Text(title, style: style);
  }
}
