part of 'detail_info_graph_bloc.dart';

class DetailInfoGraphState extends Equatable {
  const DetailInfoGraphState();

  @override
  List<Object> get props => [];
}

final class GraphDataIsLoadingState extends DetailInfoGraphState {}

final class SuccessLoadedDataDetailInfoCrypto extends DetailInfoGraphState {
  final CryptoDetailModel model;
  const SuccessLoadedDataDetailInfoCrypto(this.model);
  @override
  List<Object> get props => [model];
}

final class SuccessGraphDataLoadedState extends DetailInfoGraphState {
  final CryptoHistoryPriceListModel model;
  const SuccessGraphDataLoadedState(this.model);
  @override
  List<Object> get props => [model];
}
