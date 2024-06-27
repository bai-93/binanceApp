import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

class MarketSearchContent extends StatefulWidget {
  void Function() onDoneCallback;
  void Function(String) getDataCallback;
  MarketSearchContent(this.onDoneCallback, this.getDataCallback, {super.key});
  @override
  State<MarketSearchContent> createState() => _MarketSearchContentState();
}

class _MarketSearchContentState extends State<MarketSearchContent> {
  FocusNode textfieldFocus = FocusNode();
  bool flagFocus = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    textfieldFocus.addListener(() {
      if (textfieldFocus.hasFocus) {
        setState(() {
          flagFocus = true;
        });
      } else {
        if (controller.text.isNotEmpty) {
          widget.getDataCallback(controller.text);
        }
        setState(() {
          flagFocus = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Container(
              height: 38.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                        color: AppColorsUtility.darkPrimary.withOpacity(0.25),
                        blurRadius: 3.0,
                        offset: const Offset(0.0, 3.0))
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              child: TextField(
                controller: controller,
                focusNode: textfieldFocus,
                textAlignVertical: TextAlignVertical.center,
                cursorHeight: 18.0,
                cursorWidth: 1.0,
                cursorColor: AppColorsUtility.text,
                style: Theme.of(context).textTheme.labelMedium,
                onEditingComplete: () {
                  textfieldFocus.unfocus();
                  widget.onDoneCallback();
                },
                decoration: InputDecoration(
                    hintText: flagFocus ? null : 'Cryptocoin search ',
                    hintStyle: TextStyle(
                        color: AppColorsUtility.otline, fontSize: 16.0),
                    isDense: true,
                    border: InputBorder.none,
                    prefixIcon: Image.asset(
                      'lib/images/market/magnifier.png',
                      color: flagFocus
                          ? AppColorsUtility.darkPrimary
                          : AppColorsUtility.otline,
                      width: 24.0,
                      height: 24.0,
                    ),
                    suffixIcon: flagFocus
                        ? GestureDetector(
                            onTap: () {
                              controller.text = '';
                            },
                            child: Image.asset('lib/images/market/remove.png',
                                width: 24.0, height: 24.0),
                          )
                        : null),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    textfieldFocus.dispose();
    controller.dispose();
    super.dispose();
  }
}
