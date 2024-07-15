part of 'trade_graph_bloc.dart';

sealed class TradeGraphEvent extends Equatable {
  final String cryptoId;
  const TradeGraphEvent(this.cryptoId);
  @override
  List<Object> get props => [cryptoId];
}

final class GetDetailInfoCoinTradeGraphEvent extends TradeGraphEvent {
  const GetDetailInfoCoinTradeGraphEvent(super.cryptoId);
}

final class GetIntervalInfoCoinTradeGraphEvent extends TradeGraphEvent {
  final String interval;
  const GetIntervalInfoCoinTradeGraphEvent(this.interval, super.cryptoId);

  @override
  List<Object> get props => [interval];
}
