import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/presentation/bloc/crypto_list_bloc/bloc/crypto_list_bloc.dart';
import 'package:sheker/presentation/bloc/detail_info_graph_bloc/bloc/detail_info_graph_bloc.dart';
import 'package:sheker/presentation/bloc/detail_info_graph_bloc/indicator_price_gesture_bloc/bloc/interval_price_drag_gesture_bloc.dart';
import 'package:sheker/presentation/pages/detail_info_page/crypto_graph/graph_custom_paint.dart';
import 'package:sheker/presentation/pages/detail_info_page/crypto_graph/interval_date_component.dart';
import 'package:sheker/utilities/money_formatter.dart';
import 'package:shimmer/shimmer.dart';

class CryptoGraphPage extends StatefulWidget {
  final String cryptoId;
  const CryptoGraphPage(this.cryptoId, {super.key});
  @override
  State<CryptoGraphPage> createState() => _CryptoGraphPageState();
}

class _CryptoGraphPageState extends State<CryptoGraphPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool onStartFlag = false, onUpdateFlag = false, onEndFlag = false;
  Offset globalPoints = Offset.zero;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 10 / 6.92,
          child: BlocBuilder<DetailInfoGraphBloc, DetailInfoGraphState>(
            builder: (context, state) {
              if (state is GraphDataIsLoading) {
                return shimmerGraph();
              }
              if (state is SuccessGraphDataLoaded) {
                // _animationController.forward();
                return GestureDetector(
                  onHorizontalDragEnd: (onEnd) {
                    print("on horizontal drag end");
                    setState(() {
                      onEndFlag = true;
                    });
                  },
                  onHorizontalDragUpdate: (onUpdate) {
                    print("on update");
                    setState(() {
                      onUpdateFlag = true;
                      globalPoints = onUpdate.globalPosition;
                    });
                  },
                  child: RepaintBoundary(
                    child: CustomPaint(
                      painter: GraphCustomPaint(state.model, (priceCoin, date) {
                        context
                            .read<IntervalPriceDragGestureBloc>()
                            .add(IntervalPriceChangingEvent(priceCoin, date));
                      }, positionOfTouch: globalPoints),
                      isComplex: true,
                    ),
                  ),
                );
              }
              return Container(
                color: Colors.grey,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        BlocBuilder<IntervalPriceDragGestureBloc,
            IntervalPriceDragGestureState>(
          builder: (context, state) {
            if (state is IntervalPriceDidDragState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    MoneyFormatter.dollarFormat(state.price.toString()),
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(state.date, style: const TextStyle(fontSize: 16)),
                  const SizedBox(
                    width: 10.0,
                  )
                ],
              );
            } else {
              return const Center();
            }
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        IntervalDateComponent((String interval) {
          context
              .read<DetailInfoGraphBloc>()
              .add(GetIntervalInfoCryptoEvent(interval, widget.cryptoId));
        })
      ],
    );
  }

  Widget shimmerGraph() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        color: Colors.green,
      ),
    );
  }
}
