import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/home_page/top_content_sliver_bar/top_content_page_view.dart';

class BalanceContentSliverBar extends StatefulWidget {
  final String money;
  final void Function() goToPortfolioPage;
  const BalanceContentSliverBar(this.money, this.goToPortfolioPage,
      {super.key});

  @override
  State<BalanceContentSliverBar> createState() =>
      _BalanceContentSliverBarState();
}

class _BalanceContentSliverBarState extends State<BalanceContentSliverBar> {
  bool moneyFlag = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          topTitleText(),
          moneyTextTitle(),
          TopBalanceContentSliverBarPageView(),
        ],
      ),
    );
  }

  Widget moneyTextTitle() {
    return Row(
      children: [
        Transform.translate(
          offset: const Offset(0.0, -10.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              "${widget.money} \$",
              softWrap: true,
              style:
                  const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const Spacer(),
        IconButton(
            onPressed: widget.goToPortfolioPage,
            icon: const Icon(Icons.subdirectory_arrow_right))
      ],
    );
  }

  Widget topTitleText() {
    return Row(
      children: [
        const SizedBox(
          width: 10.0,
        ),
        const Text(
          'Общий баланс',
          softWrap: true,
          style: TextStyle(fontSize: 15.0),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                moneyFlag = !moneyFlag;
              });
            },
            icon: Icon(moneyFlag ? Icons.lock_open : Icons.lock))
      ],
    );
  }
}
