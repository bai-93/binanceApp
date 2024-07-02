import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_portfolio_page/viewmodel/wallet_portfolio_view_model.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_portfolio_page/wallet_portfolio_content/wallet_portfolio_content_graph.dart';
import 'package:sheker/presentation/pages/wallet_page/wallet_portfolio_page/wallet_portfolio_content/wallet_portfolio_top.dart';

class WalletPortfolioMain extends StatefulWidget {
  const WalletPortfolioMain({super.key});

  @override
  State<WalletPortfolioMain> createState() => _WalletPortfolioMainState();
}

class _WalletPortfolioMainState extends State<WalletPortfolioMain> {
  WalletPortfolioViewModel model = WalletPortfolioViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            WalletPortfolioTop(model.getCounOfColors(), model.getColors(),
                model.getCoinsTitle(), model.getPercents())
          ],
        ),
        const SizedBox(height: 20.0),
        WalletPortfolioContentGraph(),
      ],
    );
  }
}
