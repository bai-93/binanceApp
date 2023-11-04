part of 'detail_info_graph_bloc.dart';

sealed class DetailInfoGraphState extends Equatable {
  const DetailInfoGraphState();

  @override
  List<Object> get props => [];
}

final class DetailDataIsLoading extends DetailInfoGraphState {}

final class GraphDataIsLoading extends DetailInfoGraphState {}

final class SuccessLoadedDataDetailInfoCrypto extends DetailInfoGraphState {
  final CryptoDetailModel model;
  const SuccessLoadedDataDetailInfoCrypto(this.model);
  @override
  List<Object> get props => [model];
}

final class SuccessGraphDataLoaded extends DetailInfoGraphState {
  final CryptoHistoryPriceListModel model;
  const SuccessGraphDataLoaded(this.model);
  @override
  List<Object> get props => [model];
}
