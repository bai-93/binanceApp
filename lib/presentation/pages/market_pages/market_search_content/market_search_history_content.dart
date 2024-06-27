import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

class MarketSearchHistoryContent extends StatefulWidget {
  void Function(String) callback;
  List<String> dataHistory = [];
  MarketSearchHistoryContent(this.dataHistory, this.callback, {super.key});

  @override
  State<MarketSearchHistoryContent> createState() =>
      _MarketSearchHistoryContentState();
}

class _MarketSearchHistoryContentState
    extends State<MarketSearchHistoryContent> {
  @override
  Widget build(BuildContext context) {
    return widget.dataHistory.isEmpty
        ? const Center()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 16.0),
                  makeText('Search history', flag: true),
                  const SizedBox(
                    width: 16.0,
                  )
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: SizedBox(
                  height: 28.0,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return makeHistoryButton(widget.dataHistory[index]);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 8.0);
                      },
                      itemCount: widget.dataHistory.length),
                ),
              )
            ],
          );
  }

  Widget makeHistoryButton(String input) {
    return GestureDetector(
      onTap: () {
        widget.callback(input);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        height: 28.0,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            boxShadow: [
              BoxShadow(
                  color: AppColorsUtility.darkPrimary.withOpacity(0.25),
                  blurRadius: 3.0,
                  offset: const Offset(0.0, 3.0))
            ]),
        child: Center(
          child: makeText(input),
        ),
      ),
    );
  }

  Widget makeText(String input, {bool flag = false}) {
    TextStyle style = TextStyle(
        color: AppColorsUtility.secondary,
        fontSize: flag ? 16.0 : 14.0,
        fontWeight: FontWeight.w400);
    return Text(
      input,
      style: style,
    );
  }
}
