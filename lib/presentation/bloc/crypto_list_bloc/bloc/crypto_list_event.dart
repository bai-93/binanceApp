part of 'crypto_list_bloc.dart';

@immutable
sealed class CryptoListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CryptoListLoadEvent extends CryptoListEvent {}

class CryptoListCallBackEvent extends CryptoListEvent {
  final String date;
  final double priceCoin;
  CryptoListCallBackEvent(this.date, this.priceCoin);

  @override
  List<Object> get props => [date, priceCoin];
}
