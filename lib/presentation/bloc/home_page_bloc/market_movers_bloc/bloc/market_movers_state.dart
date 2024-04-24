part of 'market_movers_bloc.dart';

sealed class MarketMoversState extends Equatable {
  const MarketMoversState();

  @override
  List<Object> get props => [];
}

final class MarketMoversShimmerEnalbeState extends MarketMoversState {}

final class MarketMoversDataLoadedState extends MarketMoversState {
  final CryptoModelList modelList;
  const MarketMoversDataLoadedState(this.modelList);

  @override
  List<Object> get props => [modelList];
}
