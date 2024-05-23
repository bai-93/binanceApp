import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/presentation/bloc/home_page_bloc/market_movers_bloc/bloc/market_movers_bloc.dart';
import 'package:sheker/presentation/pages/home_page/portfolio/portfolio_content.dart';
import 'package:sheker/presentation/pages/home_page/portfolio/portfolio_model.dart';
import 'package:sheker/utilities/shimmer_utility.dart';

import '../../../../utilities/app_colors.dart';

class PortfolioMain extends StatelessWidget {
  PortfolioModel? _model;
  PortfolioMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<MarketMoversBloc, MarketMoversState>(
              listener: (context, state) {
            if (state is MarketMoversDataLoadedState) {
              _model = PortfolioModel(items: state.modelList.data);
            }
          })
        ],
        child: BlocBuilder<MarketMoversBloc, MarketMoversState>(
            builder: (context, state) {
          if (state is MarketMoversShimmerEnalbeState) {
            return makeShimmer(context);
          }
          if (state is MarketMoversDataLoadedState) {
            return makeCoinsListView(context);
          }
          return const Center();
        }));
  }

  Widget makeShimmer(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: 8.0, bottom: 25.0, left: 16.0, right: 16.0),
        child: SizedBox(
          height: 68.0 * 5.0,
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return makeShimmerUtility(
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 68.0,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                    ),
                    context);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8.0);
              },
              itemCount: 5),
        ));
  }

  Widget makeCoinsListView(BuildContext context) {
    int coefficient = _model?.getCountOfData() ?? 1;
    return Column(children: [
      const SizedBox(
        height: 16.0,
      ),
      makeTitleOfPortfolio(context),
      const SizedBox(
        height: 8.0,
      ),
      SizedBox(
        height: 85.0 * coefficient,
        child: ListView.separated(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _model?.getCountOfData() ?? 0,
          itemBuilder: (context, index) {
            return PortfolioCellContent(_model?.getCoinData()[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 8.0,
            );
          },
        ),
      ),
    ]);
  }

  Widget makeTitleOfPortfolio(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Portfolio',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            'More',
            style: TextStyle(
                color: AppColorsUtility.onboardingPrimary,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
