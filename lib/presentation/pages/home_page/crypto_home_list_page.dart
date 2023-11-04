import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/presentation/bloc/crypto_list_bloc/bloc/crypto_list_bloc.dart';
import 'package:sheker/presentation/pages/home_page/list_crypto_content/list_crypto_content.dart';
import 'package:sheker/presentation/pages/home_page/shimmer/home_page_shimmer.dart';
import 'package:sheker/presentation/pages/home_page/top_content_sliver_bar/crypto_content_persistent_bar.dart';
import 'package:sheker/presentation/pages/home_page/top_content_sliver_bar/crypto_sliver_bar_content.dart';

class CryptoHomePage extends StatefulWidget {
  const CryptoHomePage({super.key});

  @override
  State<CryptoHomePage> createState() => _CryptoHomePageState();
}

class _CryptoHomePageState extends State<CryptoHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<CryptoListBloc, CryptoListState>(
              listener: (context, state) {
            debugPrint("hellll");
            switch (state) {
              case CryptoListShimmerEnableState():
                debugPrint("shimmer turn ON");
              case CryptoListShimmerDisableState():
                debugPrint("shimmer turn OFF");
              case CryptoListLoaded():
                debugPrint("data was LOADED");
            }
          })
        ],
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
            builder: (context, state) {
          if (state is CryptoListShimmerEnableState) {
            return const HomePageCryptoShimmer();
          }
          return mainPage();
        }));
  }

  Widget mainPage() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          child: leading(),
          onTap: () {
            debugPrint("menu was tapped");
          },
        ),
        actions: [actions()],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.list(children: [
            BalanceContentSliverBar('13,59', () {
              debugPrint(" Go to portfolio");
            })
          ]),
          SliverPersistentHeader(
              pinned: true, delegate: CustomSliverPersistentHeaderDelegate()),
          const CryptoListContent()
        ],
      ),
    );
  }

  Widget leading() {
    return Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      color: const Color.fromRGBO(119, 126, 142, 1.0),
                      height: 10.0,
                      width: 10.0),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Transform.rotate(
                    angle: pi / 4,
                    child: Container(
                        color: const Color.fromRGBO(237, 199, 75, 1.0),
                        height: 9.5,
                        width: 9.5),
                  ),
                ],
              ),
              const SizedBox(
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 12.0,
                      width: 12.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(237, 199, 75, 1.0)),
                    ),
                    const SizedBox(
                      width: 2.0,
                    ),
                    Container(
                        color: const Color.fromRGBO(119, 126, 142, 1.0),
                        height: 10.0,
                        width: 10.0),
                    const SizedBox(
                      width: 3.0,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget actions() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        color: Colors.transparent,
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                splashRadius: 0.1,
                onPressed: () {
                  debugPrint("search");
                },
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.grey,
                )),
            IconButton(
                splashRadius: 0.1,
                onPressed: () {
                  debugPrint("camera scan");
                },
                icon: const Icon(
                  Icons.qr_code_scanner_sharp,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
    );
  }
}
