import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sheker/presentation/pages/home_page/crypto_content_persistent_bar.dart';
import 'package:sheker/presentation/pages/home_page/top_content_sliver_bar/crypto_sliver_bar_content.dart';

class CryptoHomePage extends StatefulWidget {
  const CryptoHomePage({super.key});

  @override
  State<CryptoHomePage> createState() => _CryptoHomePageState();
}

class _CryptoHomePageState extends State<CryptoHomePage> {
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
                        height: 10.0,
                        width: 10.0),
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

  @override
  Widget build(BuildContext context) {
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
        actions: [
          Padding(
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
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.list(children: [
            ContentSliverBar('13,59', () {
              print(" Go to portfolio");
            })
          ]),
          SliverPersistentHeader(
              pinned: true, delegate: CustomSliverPersistentHeaderDelegate()),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Container(
                color: index.isEven ? Colors.white : Colors.white,
                height: 50.0,
              );
            },
            itemCount: 20,
          )
        ],
      ),
    );
  }
}
