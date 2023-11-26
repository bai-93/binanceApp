part of 'interval_price_drag_gesture_bloc.dart';

sealed class IntervalPriceDragGestureState extends Equatable {
  const IntervalPriceDragGestureState();

  @override
  List<Object> get props => [];
}

final class IntervalPriceDragGestureInitial
    extends IntervalPriceDragGestureState {}

final class IntervalPriceDidDragState extends IntervalPriceDragGestureState {
  final double price;
  final String date;

  const IntervalPriceDidDragState(this.price, this.date);

  @override
  List<Object> get props => [price, date];
}
