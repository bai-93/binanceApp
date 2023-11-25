import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sheker/domain/models/responses/crypto_models/list_crypto_currencies_model.dart';
import 'package:sheker/presentation/bloc/crypto_list_bloc/bloc/crypto_list_bloc.dart';

class CryptoListContent extends StatelessWidget {
  const CryptoListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoListBloc, CryptoListState>(
      builder: (context, state) {
        if (state is CryptoListLoaded) {
          return SliverList.builder(
              itemCount: state.modelList.data.length,
              itemBuilder: (context, index) {
                return contentList(index, state.modelList.data[index], context);
              });
        }
        return const SizedBox();
      },
    );
  }

  Widget contentList(int index, CryptoModel model, BuildContext context) {
    NumberFormat format =
        NumberFormat.decimalPatternDigits(locale: 'en_us', decimalDigits: 2);
    double money = double.parse(model.priceUsd!);
    return ListTile(
      splashColor: Colors.transparent,
      tileColor: Colors.white,
      leading: Container(color: Colors.yellow, height: 50.0, width: 50.0),
      title: Text(
        "${model.name}",
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      subtitle: Text("${model.symbol}"),
      trailing: Text(
        '${format.format(money)} \$',
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w300),
      ),
      onTap: () {
        context.go('/a/detailInfo/${model.id}');
      },
    );
  }
}
