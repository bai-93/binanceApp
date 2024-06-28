import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/presentation/bloc/market/bloc/market_bloc.dart';
import 'package:sheker/presentation/bloc/market/market_graph_bloc/bloc/market_graph_bloc.dart';
import 'package:sheker/presentation/pages/market_pages/market_coin_content/market_coin_content.dart';
import 'package:sheker/presentation/pages/market_pages/market_search_content/market_search_content.dart';
import 'package:sheker/presentation/pages/market_pages/market_search_content/market_search_history_content.dart';
import 'package:sheker/presentation/pages/market_pages/shimmer/market_data_shimmer.dart';
import 'package:sheker/presentation/pages/market_pages/viewmodel/market_view_model.dart';
import 'package:sheker/utilities/app_colors.dart';

class MarketMain extends BaseScreen {
  const MarketMain({super.key});

  @override
  State<MarketMain> createState() => _MarketMainState();
}

class _MarketMainState extends BaseScreenState<MarketMain>
    with BaseScreenMixin {
  MarketViewModel model = MarketViewModel();
  @override
  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    return super.typeAppbar(type: AppbarType.custom);
  }

  @override
  AppBar customAppbar() {
    return AppBar(
      title: Text('Market', style: Theme.of(context).textTheme.bodyLarge),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      actions: [
        IconButton(
            onPressed: () {
              debugPrint('filter tapped');
            },
            icon: Image.asset('lib/images/market/filter.png',
                width: 24.0, height: 24.0))
      ],
    );
  }

  @override
  void initState() {
    context.read<MarketBloc>().add(MarketLoadingEvent());
    super.initState();
  }

  @override
  Widget body() {
    return Column(
      children: [
        const SizedBox(
          height: 16.0,
        ),
        MarketSearchContent(() {
          debugPrint('on done callback');
        }, (value) {
          setState(() {
            model.addToHistory(value.trim());
          });
        }),
        const SizedBox(height: 16.0),
        MarketSearchHistoryContent(model.getHistoryData(), (value) {
          debugPrint(value);
        }),
        const SizedBox(
          height: 8.0,
        ),
        Container(
          color: AppColorsUtility.otline,
          height: 1.0,
          width: sizeOfScreen().width,
        ),
        const SizedBox(
          height: 8.0,
        ),
        BlocBuilder<MarketBloc, MarketState>(
          builder: (context, state) {
            if (state is MarketLoadingData) {
              return const MarketDataShimmer();
            }
            if (state is MarketDataWasLoaded) {
              return SizedBox(
                width: sizeOfScreen().width,
                height: state.data.data.length * 84.0,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  // cacheExtent: 10,
                  itemCount: state.data.data.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 8.0,
                    );
                  },
                  itemBuilder: (context, index) {
                    return BlocProvider(
                      create: (context) => MarketGraphBloc(),
                      child: MarketCoinContent(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('added')));
                      }, state.data.data[index]),
                    );
                  },
                ),
              );
            }
            return const Center();
          },
        )
      ],
    );
  }
}
