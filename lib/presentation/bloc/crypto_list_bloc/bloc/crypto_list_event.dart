part of 'crypto_list_bloc.dart';

@immutable
sealed class CryptoListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CryptoListLoadEvent extends CryptoListEvent {}