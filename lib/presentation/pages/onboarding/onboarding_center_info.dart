import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

class OnboardingImageTitle extends StatelessWidget {
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

  OnboardingImageTitle(int index, {super.key}) {
    indexItem = index;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: AspectRatio(
          aspectRatio: 2.0 / 3.0,
          child: AnimatedSwitcher(
            // key: UniqueKey(),
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              'lib/images/onboarding/${imagesName[indexItem]}',
              key: ValueKey(indexItem),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 15.0, bottom: 8.0),
          child: Text(
            titleContent[indexItem],
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.text, fontSize: 32.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
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
    ]);
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
}
