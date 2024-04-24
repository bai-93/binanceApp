part of 'market_movers_bloc.dart';

sealed class MarketMoversEvent extends Equatable {
  const MarketMoversEvent();

  @override
  List<Object> get props => [];
}

class MarketMoversStartLoadingDataEvent extends MarketMoversEvent {}
