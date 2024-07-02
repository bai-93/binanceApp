import 'package:flutter/material.dart';

class WalletPortfolioTop extends StatelessWidget {
  final int count;
  final List<Color> colors;
  final List<String> titles;
  final List<int> percents;
  const WalletPortfolioTop(this.count, this.colors, this.titles, this.percents,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: 28.0,
              decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: const BorderRadius.all(Radius.circular(8.0))),
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 6.0, bottom: 6.0),
                  child: makeText(titles[index], percents[index], context)),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 8.0);
          },
          itemCount: count),
    );
  }

  Widget makeText(String inputTitle, int inputPercent, BuildContext context) {
    return Text(
      '$inputTitle $inputPercent%',
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
