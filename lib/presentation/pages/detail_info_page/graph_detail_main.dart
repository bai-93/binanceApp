import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/domain/models/responses/crypto_models/crypto_detail_model.dart';
import 'package:sheker/presentation/bloc/detail_info_graph_bloc/bloc/detail_info_graph_bloc.dart';
import 'package:sheker/presentation/pages/detail_info_page/crypto_graph/crypto_graph_page.dart';
import 'package:sheker/presentation/pages/detail_info_page/detail_info/crypto_description.dart';
import 'package:sheker/presentation/pages/detail_info_page/shimmer/crypto_graph_shimmer.dart';
import 'package:sheker/presentation/pages/detail_info_page/top_description.dart';

class GraphDetailPage extends StatefulWidget {
  final String cryptoId;
  const GraphDetailPage(this.cryptoId, {super.key});

  @override
  State<GraphDetailPage> createState() => _GraphDetailPageState();
}

class _GraphDetailPageState extends State<GraphDetailPage> {
  CryptoDetailModel? model;
  @override
  void initState() {
    context
        .read<DetailInfoGraphBloc>()
        .add(GetDetailInfoCryptoEvent(widget.cryptoId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: const Icon(
                Icons.notifications,
                color: Colors.grey,
              )),
          IconButton(
              onPressed: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.star,
                color: Colors.yellowAccent.shade700,
              ))
        ],
      ),
      body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: MultiBlocListener(
            listeners: [
              BlocListener<DetailInfoGraphBloc, DetailInfoGraphState>(
                  listener: (context, state) {
                if (state is SuccessLoadedDataDetailInfoCrypto) {
                  model = state.model;
                  context
                      .read<DetailInfoGraphBloc>()
                      .add(GetIntervalInfoCryptoEvent('m5', widget.cryptoId));
                }
              })
            ],
            child: BlocBuilder<DetailInfoGraphBloc, DetailInfoGraphState>(
              builder: (context, state) {
                if (state is DetailDataIsLoading) {
                  return const CryptoGraphShimmer();
                }
                if (state is SuccessLoadedDataDetailInfoCrypto) {
                  return mainPage();
                }
                return mainPage();
              },
            ),
          )),
    );
  }

  Widget mainPage() {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 5.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: CryptoTopDescription(model),
        ),
        CryptoGraphPage(widget.cryptoId),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: CryptoDescription(model),
        )
      ],
    ));
  }
}
