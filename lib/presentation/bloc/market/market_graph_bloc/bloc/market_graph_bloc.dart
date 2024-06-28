import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';
import 'package:sheker/domain/usecases/history_page_usecase/get_history_crypto_detail_usecase.dart';
import 'package:sheker/injection/injection_configure.dart';

part 'market_graph_event.dart';
part 'market_graph_state.dart';

class MarketGraphBloc extends Bloc<MarketGraphEvent, MarketGraphState> {
  GetCryptoHistoryUsecase getCryptoHistoryUsecase =
      getIt<GetCryptoHistoryUsecase>();
  MarketGraphBloc() : super(MarketGraphInitial()) {
    on<MarketGraphCoinIntervalEvent>((event, emit) async {
      emit(MarketIsLoadingState());
      final output = await getCryptoHistoryUsecase.call(event.coinId,
          second: event.interval);
      emit(MarketGraphSuccessLoadedState(output));
      ;
    });
  }
}
