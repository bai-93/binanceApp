part of 'crypto_list_bloc.dart';

sealed class CryptoListState extends Equatable {
  bool shimmerFlag = true;
  CryptoListState({this.shimmerFlag = true});

  @override
  List<Object> get props => [shimmerFlag];
}

class CryptoListShimmerEnableState extends CryptoListState {
  CryptoListShimmerEnableState() : super(shimmerFlag: true);
}

class CryptoListShimmerDisableState extends CryptoListState {
  CryptoListShimmerDisableState() : super(shimmerFlag: false);
}

class CryptoListLoaded extends CryptoListState {
  final CryptoModelList modelList;
  CryptoListLoaded(this.modelList);

  @override
  List<Object> get props => [modelList];
}