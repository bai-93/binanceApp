part of 'interval_price_drag_gesture_bloc.dart';

sealed class IntervalPriceDragGestureEvent extends Equatable {
  const IntervalPriceDragGestureEvent();
  @override
  List<Object> get props => [];
}

class IntervalPriceChangingEvent extends IntervalPriceDragGestureEvent {
  final double price;
  final String date;

  const IntervalPriceChangingEvent(this.price, this.date);

  @override
  List<Object> get props => [price, date];
}
