import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_detail_model.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';
import 'package:sheker/domain/usecases/history_page_usecase/get_crypto_detail_usecase.dart';
import 'package:sheker/domain/usecases/history_page_usecase/get_history_crypto_detail_usecase.dart';
import 'package:sheker/injection/injection_configure.dart';

part 'trade_graph_event.dart';
part 'trade_graph_state.dart';

class TradeGraphBloc extends Bloc<TradeGraphEvent, TradeGraphState> {
  GetCryptoDetailUsecase detailUsecase = getIt<GetCryptoDetailUsecase>();
  GetCryptoHistoryUsecase getCryptoHistoryUsecase =
      getIt<GetCryptoHistoryUsecase>();
  TradeGraphBloc() : super(GraphDataLoadingGraphTradeState()) {
    on<GetDetailInfoCoinTradeGraphEvent>((event, emit) async {
      emit(GraphDataLoadingGraphTradeState());
      final result = await detailUsecase.call(event.cryptoId);
      emit(SuccessLoadedDetailInfoCoinGraphTradeState(result));
    });
    on<GetIntervalInfoCoinTradeGraphEvent>((event, emit) async {
      emit(GraphDataLoadingGraphTradeState());
      try {
        final result = await getCryptoHistoryUsecase.call(event.cryptoId,
            second: event.interval);
        emit(SuccessLoadedIntervalHistoryGraphTradeState(result));
      } catch (error) {
        debugPrint('Something goes wrong interval data');
      }
    });
  }
}
