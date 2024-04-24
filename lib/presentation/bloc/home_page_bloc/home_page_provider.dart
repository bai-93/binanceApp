import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/presentation/bloc/home_page_bloc/balance_bloc/bloc/balance_bloc.dart';
import 'package:sheker/presentation/bloc/home_page_bloc/market_movers_bloc/bloc/market_movers_bloc.dart';
import 'package:sheker/presentation/bloc/home_page_bloc/portfolio_bloc/bloc/portfolio_bloc.dart';

class HomePageProvider {
  static get providers {
    return [
      BlocProvider<BalanceBloc>(
        create: (context) {
          return BalanceBloc();
        },
      ),
      BlocProvider<MarketMoversBloc>(
        create: (context) {
          return MarketMoversBloc();
        },
      ),
      BlocProvider<PortfolioBloc>(
        create: (context) {
          return PortfolioBloc();
        },
      ),
    ];
  }
}
