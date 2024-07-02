import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_portfolio_page/wallet_portfolio_content/wallet_portfolio_circular_graph.dart';

class WalletPortfolioContentGraph extends StatefulWidget {
  const WalletPortfolioContentGraph({super.key});

  @override
  State<WalletPortfolioContentGraph> createState() =>
      _WalletPortfolioContentGraphState();
}

class _WalletPortfolioContentGraphState
    extends State<WalletPortfolioContentGraph> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220.0,
      height: 206.0,
      child: CustomPaint(
        painter: WalletPortfolioCircularGraph(),
      ),
    );
  }
}
