import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sheker/domain/entities/favorites_hive.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:sheker/utilities/money_formatter.dart';

class FavoritesContent extends StatefulWidget {
  void Function() removeCallback;
  FavoritesHive input;
  FavoritesContent(this.input, this.removeCallback, {super.key});

  @override
  State<FavoritesContent> createState() => _FavoritesContentState();
}

class _FavoritesContentState extends State<FavoritesContent>
    with SingleTickerProviderStateMixin {
  late SlidableController _controller;

  @override
  void initState() {
    _controller = SlidableController(this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return makeContent(widget.input);
  }

  Widget makeContent(FavoritesHive input) {
    return Slidable(
      controller: _controller,
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        GestureDetector(
          onTap: () {
            _controller.close();
            widget.removeCallback();
          },
          child: Container(
            width: 83.0,
            height: 76.0,
            decoration: BoxDecoration(
                color: AppColorsUtility.red,
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                boxShadow: [
                  BoxShadow(
                      color: AppColorsUtility.internalShadow,
                      offset: const Offset(0.0, 3.0),
                      blurRadius: 3.0)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16.0),
                    Image.asset('lib/images/favorites/trash.png',
                        width: 24.0, height: 24.0),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text('Remove',
                        style: Theme.of(context).textTheme.headlineSmall)
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Container(
          height: 76.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              boxShadow: [
                BoxShadow(
                    color: AppColorsUtility.internalShadow,
                    offset: const Offset(0.0, 3.0),
                    blurRadius: 3.0)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 14.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      makeText16(input.symbol ?? ''),
                      makeText12('/USDT')
                    ],
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  makeText10('vol ${input.volume24h ?? 0.0}')
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const SizedBox(height: 8.0),
                  makeText10('Price ${input.topPrice.toString()}\$'),
                  const SizedBox(height: 2.0)
                ],
              ),
              const Spacer(),
              makePercentContainer(input.percent24h ?? 0.0),
              const SizedBox(width: 14.0)
            ],
          ),
        ),
      ),
    );
  }

  Widget makeText16(String input) {
    return Text(
      input,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }

  Widget makeText12(String input) {
    return Text(
      input,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }

  Widget makeText10(String input) {
    return Text(
      input,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }

  Widget makePercentContainer(double input) {
    double changePercent24Hr = input;
    Color backgroundColor = changePercent24Hr >= 0.0
        ? AppColorsUtility.green
        : AppColorsUtility.red;
    String positiveNegativePercent = changePercent24Hr >= 0.0 ? '+' : '';
    String formatedValue = changePercent24Hr.toString();
    String outputText = '$positiveNegativePercent$formatedValue%';
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          color: backgroundColor),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 4.0, top: 2.0, bottom: 2.0, right: 4.0),
        child: Text(outputText,
            style: TextStyle(
                color: AppColorsUtility.surface,
                fontSize: 14.0,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
