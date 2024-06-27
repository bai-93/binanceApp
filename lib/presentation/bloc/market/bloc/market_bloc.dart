import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/domain/usecases/home_page_usecase/get_crypto_list_usecase.dart';
import 'package:sheker/injection/injection_configure.dart';
part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc() : super(MarketLoadingData()) {
    GetCryptoListUseCaseImpl cryptoUseCase = getIt<GetCryptoListUseCaseImpl>();
    on<MarketLoadingEvent>((event, emit) async {
      emit(MarketLoadingData());
      final data = await cryptoUseCase.call(null);
      emit(MarketDataWasLoaded(data));
    });
  }
}
