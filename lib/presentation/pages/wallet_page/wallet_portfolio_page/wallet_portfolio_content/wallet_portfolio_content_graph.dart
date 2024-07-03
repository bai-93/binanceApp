import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_portfolio_page/wallet_portfolio_content/wallet_portfolio_circular_graph.dart';

class WalletPortfolioContentGraph extends StatefulWidget {
  final List<int> percents;
  final List<Color> colors;
  const WalletPortfolioContentGraph(this.percents, this.colors, {super.key});

  @override
  State<WalletPortfolioContentGraph> createState() =>
      _WalletPortfolioContentGraphState();
}

class _WalletPortfolioContentGraphState
    extends State<WalletPortfolioContentGraph>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> progressValue;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    progressValue = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(
        () {
          setState(() {});
        },
      );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      SizedBox(
        width: 185.0,
        height: 180.0,
        child: CustomPaint(
          painter: WalletPortfolioCircularGraph(
              widget.percents, widget.colors, progressValue.value),
        ),
      ),
      Column(
        children: [
          Text(
            'My balance',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            '\$2,760.23',
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      )
    ]);
  }
}
