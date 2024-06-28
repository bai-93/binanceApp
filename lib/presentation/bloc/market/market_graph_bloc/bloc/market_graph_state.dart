part of 'market_graph_bloc.dart';

sealed class MarketGraphState extends Equatable {
  const MarketGraphState();

  @override
  List<Object> get props => [];
}

final class MarketGraphInitial extends MarketGraphState {}

final class MarketIsLoadingState extends MarketGraphState {}

final class MarketGraphSuccessLoadedState extends MarketGraphState {
  final CryptoHistoryPriceListModel model;

  const MarketGraphSuccessLoadedState(this.model);

  @override
  List<Object> get props => [model];
}
