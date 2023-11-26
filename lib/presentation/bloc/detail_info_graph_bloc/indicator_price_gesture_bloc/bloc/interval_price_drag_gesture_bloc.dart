import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'interval_price_drag_gesture_event.dart';
part 'interval_price_drag_gesture_state.dart';

class IntervalPriceDragGestureBloc
    extends Bloc<IntervalPriceDragGestureEvent, IntervalPriceDragGestureState> {
  IntervalPriceDragGestureBloc() : super(IntervalPriceDragGestureInitial()) {
    on<IntervalPriceChangingEvent>((event, emit) {
      emit(IntervalPriceDidDragState(event.price, event.date));
    });
  }
}
