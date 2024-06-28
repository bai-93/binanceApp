part of 'market_graph_bloc.dart';

sealed class MarketGraphEvent extends Equatable {
  const MarketGraphEvent();

  @override
  List<Object> get props => [];
}

class MarketGraphCoinIntervalEvent extends MarketGraphEvent {
  final String coinId;
  final String interval;

  const MarketGraphCoinIntervalEvent(this.coinId, {this.interval = 'h1'});

  @override
  List<Object> get props => [coinId, interval];
}
