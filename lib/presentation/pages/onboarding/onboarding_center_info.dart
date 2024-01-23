import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/utilities/app_colors.dart';

class OnboardingImageTitle extends StatelessWidget {
  late Animation<double> controller;
  int indexItem = 0;
  String subtitle =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eget mauris massa pharetra.';
  List<String> titleContent = [
    'Take hold of your finances',
    'Smart trading tools',
    'Invest in the future'
  ];
  List<String> imagesName = [
    'illustration1.png',
    'illustration2.png',
    'illustration3.png'
  ];
  List<PositionsCoin> positionsBitcoin = [];
  List<PositionsCoin> positionsEthereum = [];
  List<PositionsCoin> positionsSolana = [];

  OnboardingImageTitle(int index, Animation<double> parent, {super.key}) {
    indexItem = index;
    controller = parent;
  }

  @override
  Widget build(BuildContext context) {
    initPositions(context);
    return AnimatedOpacity(
      opacity: controller.value,
      duration: const Duration(milliseconds: 900),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: AspectRatio(
            aspectRatio: 2.0 / 3.0,
            child: Container(
              color: Colors.transparent,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Image.asset(
                  'lib/images/onboarding/${imagesName[indexItem]}',
                  key: ValueKey(indexItem),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 15.0, bottom: 8.0),
            child: Text(
              titleContent[indexItem],
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.text, fontSize: 32.0),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
            child: Row(children: [
              Expanded(
                child: Text(
                  subtitle,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.text, fontSize: 14.0),
                ),
              ),
            ]),
          ),
          dotIndicator(),
          const SizedBox(
            height: 24.0,
          ),
        ]),
        AnimatedPositioned(
            top: positionsBitcoin[indexItem].top,
            bottom: positionsBitcoin[indexItem].bottom,
            left: positionsBitcoin[indexItem].left,
            right: positionsBitcoin[indexItem].right,
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              'lib/images/onboarding/bitcoin.png',
              width: 40.0,
              height: 40.0,
            )),
        AnimatedPositioned(
            top: positionsEthereum[indexItem].top,
            bottom: positionsEthereum[indexItem].bottom,
            left: positionsEthereum[indexItem].left,
            right: positionsEthereum[indexItem].right,
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              'lib/images/onboarding/ethereum.png',
              width: 40.0,
              height: 40.0,
            )),
        AnimatedPositioned(
            top: positionsSolana[indexItem].top,
            bottom: positionsSolana[indexItem].bottom,
            left: positionsSolana[indexItem].left,
            right: positionsSolana[indexItem].right,
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              'lib/images/onboarding/solana.png',
              width: 40.0,
              height: 40.0,
            )),
      ]),
    );
  }

  Widget dotIndicator() {
    List<Widget> dot = [];
    for (var i = 0; i < 3; i++) {
      dot.add(AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 4.0,
        width: i == indexItem ? 24.0 : 12,
        decoration: BoxDecoration(
            color: i == indexItem
                ? AppColors.onboardingPrimary
                : AppColors.secondary,
            borderRadius: BorderRadius.circular(2.0)),
      ));
      if (i != 2) {
        dot.add(const SizedBox(
          width: 4.0,
        ));
      }
    }
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: dot);
  }

  void initPositions(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    positionsBitcoin = [
      PositionsCoin(-size.height * 0.18, 0.0, -size.width * 0.8, 0.0),
      PositionsCoin(-size.height * 0.36, 0.0, -size.width * 0.35, 0.0),
      PositionsCoin(-size.height * 0.23, 0.0, 0.0, -size.width * 0.6),
    ];

    positionsEthereum = [
      PositionsCoin(-size.height * 0.5, 0.0, size.width * 0.001, 0.0),
      PositionsCoin(-size.height * 0.48, 0.0, size.width * 0.32, 0.0),
      PositionsCoin(0.0, -size.height * 0.18, -size.width * 0.5, 0.0)
    ];

    positionsSolana = [
      PositionsCoin(-size.height * 0.18, 0.0, 0.0, -size.width * 0.8),
      PositionsCoin(-size.height * 0.42, 0.0, -size.width * 0.001, 0.0),
      PositionsCoin(-size.height * 0.25, 0.0, -size.width * 0.5, 0.0)
    ];
  }
}

class PositionsCoin {
  double? top = null;
  double? bottom = null;
  double? left = null;
  double? right = null;

  PositionsCoin(double? topLocal, double? bottomLocal, double? leftLocal,
      double? rightLocal) {
    top = topLocal;
    bottom = bottomLocal;
    left = leftLocal;
    right = rightLocal;
  }
}
