import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/presentation/bloc/home_page_bloc/market_movers_bloc/bloc/market_movers_bloc.dart';
import 'package:sheker/presentation/pages/home_page/market_movers/market_movers_content.dart';
import 'package:sheker/presentation/pages/home_page/shimmer/market_mover_shimmer.dart';
import 'package:sheker/presentation/pages/tab_bar/main_part/tab_index_observable.dart';
import 'package:sheker/utilities/app_colors.dart';

class MarketMovers extends StatefulWidget {
  const MarketMovers({super.key});

  @override
  State<MarketMovers> createState() => _MarketMoversState();
}

class _MarketMoversState extends State<MarketMovers> {
  @override
  void initState() {
    super.initState();
    context.read<MarketMoversBloc>().add(MarketMoversStartLoadingDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketMoversBloc, MarketMoversState>(
      builder: (context, state) {
        if (state is MarketMoversDataLoadedState) {
          return makeListView(state.modelList.data);
        }
        return const MarketMoversShimmer();
      },
    );
  }

  Widget makeListView(List<CryptoModel> data) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              debugPrint("on tap Movers");
              getIt<TabIndexObserver>().setIndex(2);
            },
            child: Container(
              color: Colors.transparent,
              height: 18.0,
              width: MediaQuery.of(context).size.width - 32.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Market Movers',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    'More',
                    style: TextStyle(
                        color: AppColors.onboardingPrimary,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 180.0,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              itemCount: 5,
              itemBuilder: (context, item) {
                return MarketMoversContent(data[item]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 8.0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
