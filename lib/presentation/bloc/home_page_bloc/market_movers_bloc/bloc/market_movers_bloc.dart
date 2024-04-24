import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/domain/usecases/home_page_usecase/get_crypto_list_usecase.dart';
import 'package:sheker/injection/injection_configure.dart';

part 'market_movers_event.dart';
part 'market_movers_state.dart';

class MarketMoversBloc extends Bloc<MarketMoversEvent, MarketMoversState> {
  GetCryptoListUseCaseImpl cryptoUseCase = getIt<GetCryptoListUseCaseImpl>();
  MarketMoversBloc() : super(MarketMoversShimmerEnalbeState()) {
    on<MarketMoversStartLoadingDataEvent>((event, emit) async {
      emit(MarketMoversShimmerEnalbeState());
      final data = await cryptoUseCase.call(() {});
      emit(MarketMoversDataLoadedState(data));
    });
  }
}
