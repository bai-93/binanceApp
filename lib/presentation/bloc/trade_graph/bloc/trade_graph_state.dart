part of 'trade_graph_bloc.dart';

sealed class TradeGraphState extends Equatable {
  const TradeGraphState();

  @override
  List<Object> get props => [];
}

final class GraphDataLoadingGraphTradeState extends TradeGraphState {}

final class SuccessLoadedDetailInfoCoinGraphTradeState extends TradeGraphState {
  final CryptoDetailModel model;
  const SuccessLoadedDetailInfoCoinGraphTradeState(this.model);
  @override
  List<Object> get props => [model];
}

final class SuccessLoadedIntervalHistoryGraphTradeState
    extends TradeGraphState {
  final CryptoHistoryPriceListModel model;
  const SuccessLoadedIntervalHistoryGraphTradeState(this.model);
  @override
  List<Object> get props => [model];
}
