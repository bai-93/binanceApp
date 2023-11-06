import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/presentation/bloc/detail_info_graph_bloc/bloc/detail_info_graph_bloc.dart';
import 'package:sheker/presentation/pages/detail_info_page/crypto_graph/graph_custom_paint.dart';
import 'package:sheker/presentation/pages/detail_info_page/crypto_graph/interval_date_component.dart';
import 'package:shimmer/shimmer.dart';

class CryptoGraphPage extends StatefulWidget {
  final String cryptoId;
  const CryptoGraphPage(this.cryptoId, {super.key});
  @override
  State<CryptoGraphPage> createState() => _CryptoGraphPageState();
}

class _CryptoGraphPageState extends State<CryptoGraphPage> {
  @override
  void initState() {
    super.initState();
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
                return CustomPaint(
                  painter: GraphCustomPaint(state.model),
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
