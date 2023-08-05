import 'package:flutter/material.dart';

abstract class BaseAlertsDTO {
  String? mainTitleInfo;
  String? subTitleInfo;
  String? image;
  String? nameTopButton;
  String? nameBottomButton;
  MaterialColor? mainBackgroundColor;
  MaterialColor? subBackgroundColor;

  BaseAlertsDTO(
      {this.mainTitleInfo,
      this.subTitleInfo,
      this.image,
      this.nameTopButton,
      this.nameBottomButton,
      this.mainBackgroundColor,
      this.subBackgroundColor});

  MaterialColor getMainBackgroundColor() {
    return mainBackgroundColor ?? Colors.lightBlue;
  }

  MaterialColor getSubBackgroundColor() {
    return subBackgroundColor ?? Colors.red;
  }

  String getMainSubTitleInfo() {
    return mainTitleInfo ?? 'Hello default main title info';
  }

  String getSubTitleInfo() {
    return subTitleInfo ?? 'Hello default sub title info';
  }

  String getNameTopButton() {
    return nameTopButton ?? 'top button name';
  }

  String getNameBottomButton() {
    return nameBottomButton ?? 'bottom button name';
  }
}

abstract class BaseAlerts extends StatelessWidget {
  final BaseAlertsDTO? dto;
  const BaseAlerts({Key? key, required this.dto}) : super(key: key);
}

mixin AlertsMixin on BaseAlerts {
  FilledButton topButton(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: () => topButtonAction(context),
        child: Center(
          child: Text(dto?.getNameTopButton() ?? ''),
        ));
  }

  FilledButton bottomButton(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(backgroundColor: Colors.red),
        onPressed: () => bottomButtonAction(context),
        child: Center(
          child: Text(dto?.getNameBottomButton() ?? ''),
        ));
  }

  Image imageWidget() {
    return Image.asset(
      '',
      fit: BoxFit.fill,
    );
  }

  void topButtonAction(BuildContext context) {
    debugPrint('top button action');
    Navigator.pop(context);
  }

  void bottomButtonAction(BuildContext context) {
    debugPrint('bottom button action');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 100.0, left: 50.0, right: 50.0, bottom: 20.0),
              child: Container(color: Colors.green, child: imageWidget()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 50.0),
            child: SizedBox(height: 45.0, child: topButton(context)),
          ),
          Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
              child: SizedBox(height: 45.0, child: bottomButton(context))),
          const SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}

class SuccessAlert extends BaseAlerts with AlertsMixin {
  SuccessAlert({super.key, required super.dto});
}

class SuccessAlertDTO extends BaseAlertsDTO {
  String? dataItem;
  SuccessAlertDTO(dataItem, String? nameTopButton, String? nameBottomButton)
      : super(
            subTitleInfo: 'hello subtitle',
            mainTitleInfo: 'main subtitle',
            image: 'image property',
            nameTopButton: nameTopButton,
            nameBottomButton: nameBottomButton);
}
