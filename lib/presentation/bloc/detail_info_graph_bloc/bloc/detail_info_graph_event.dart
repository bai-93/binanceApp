part of 'detail_info_graph_bloc.dart';

sealed class DetailInfoGraphEvent extends Equatable {
  final String cryptoId;
  const DetailInfoGraphEvent(this.cryptoId);
  @override
  List<Object> get props => [cryptoId];
}

final class GetDetailInfoCryptoEvent extends DetailInfoGraphEvent {
  const GetDetailInfoCryptoEvent(super.cryptoId);
}

final class GetIntervalInfoCryptoEvent extends DetailInfoGraphEvent {
  final String interval;
  const GetIntervalInfoCryptoEvent(this.interval, super.cryptoId);
  @override
  List<Object> get props => [interval];
}
