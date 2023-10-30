import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sheker/presentation/bloc/crypto_list_bloc/bloc/crypto_list_bloc.dart';
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
  bool moneyFlag = false;

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
            padding: const EdgeInsets.only(left: 10.0),
            child: BlocBuilder<CryptoListBloc, CryptoListState>(
              builder: (context, state) {
                if (state is CryptoListLoaded) {
                  NumberFormat format = NumberFormat.decimalPatternDigits(
                      locale: 'en_us', decimalDigits: 2);
                  double money =
                      double.parse(state.modelList.data.first.priceUsd!);
                  return Text(
                    "${moneyFlag ? format.format(money).replaceAll(RegExp('[0-9]'), '*') : format.format(money)} \$",
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.w500),
                  );
                }
                return const SizedBox();
              },
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
            icon: Icon(moneyFlag ? Icons.lock : Icons.lock_open))
      ],
    );
  }
}
