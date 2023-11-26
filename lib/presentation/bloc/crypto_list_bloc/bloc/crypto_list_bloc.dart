import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/domain/usecases/home_page_usecase/get_crypto_list_usecase.dart';
import 'package:sheker/injection/injection_configure.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  GetCryptoListUseCaseImpl getCryptoListUsecase =
      getIt<GetCryptoListUseCaseImpl>();

  CryptoListBloc() : super(CryptoListShimmerEnableState()) {
    on<CryptoListLoadEvent>((event, emit) async {
      emit(CryptoListShimmerEnableState());
      final cryptoDataList = await getCryptoListUsecase.call(() {});
      emit(CryptoListLoaded(cryptoDataList));
    });
  }
}
