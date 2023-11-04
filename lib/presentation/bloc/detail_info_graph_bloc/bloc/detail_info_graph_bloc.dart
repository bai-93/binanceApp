import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_detail_model.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_history_price_model.dart';
import 'package:sheker/domain/usecases/history_page_usecase/get_crypto_detail_usecase.dart';
import 'package:sheker/domain/usecases/history_page_usecase/get_history_crypto_detail_usecase.dart';
import 'package:sheker/injection/injection_configure.dart';

part 'detail_info_graph_event.dart';
part 'detail_info_graph_state.dart';

class DetailInfoGraphBloc
    extends Bloc<DetailInfoGraphEvent, DetailInfoGraphState> {
  GetCryptoDetailUsecase detailUsecase = getIt<GetCryptoDetailUsecase>();
  GetCryptoHistoryUsecase getCryptoHistoryUsecase =
      getIt<GetCryptoHistoryUsecase>();

  DetailInfoGraphBloc() : super(DetailDataIsLoading()) {
    on<GetDetailInfoCryptoEvent>((event, emit) async {
      emit(DetailDataIsLoading());
      final result = await detailUsecase.call(event.cryptoId);
      emit(SuccessLoadedDataDetailInfoCrypto(result));
    });
    on<GetIntervalInfoCryptoEvent>((event, emit) async {
      emit(GraphDataIsLoading());
      try {
        final result = await getCryptoHistoryUsecase.call(event.cryptoId,
            second: event.interval);
        emit(SuccessGraphDataLoaded(result));
      } catch (error) {
        print("eroorororrororroroorororoo");
        print(error.toString());
      }
    });
  }
}
