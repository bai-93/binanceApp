part of 'market_bloc.dart';

sealed class MarketState extends Equatable {
  const MarketState();

  @override
  List<Object> get props => [];
}

final class MarketLoadingData extends MarketState {}

final class MarketDataWasLoaded extends MarketState {
  CryptoModelList data;
  MarketDataWasLoaded(this.data);

  @override
  List<Object> get props => [data];
}
