part of 'balance_bloc.dart';

sealed class BalanceState extends Equatable {
  const BalanceState();
  
  @override
  List<Object> get props => [];
}

final class BalanceInitial extends BalanceState {}
