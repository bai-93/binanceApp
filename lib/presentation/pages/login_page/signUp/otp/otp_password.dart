import 'package:flutter/material.dart';
import 'package:sheker/presentation/bloc/sign_up/bloc/otp_bloc.dart';
import 'package:sheker/utilities/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpPasswordFields extends StatefulWidget {
  const OtpPasswordFields({super.key});

  @override
  State<OtpPasswordFields> createState() => _OtpPasswordFieldsState();
}

class _OtpPasswordFieldsState extends State<OtpPasswordFields> {
  List<Widget> textField = [];
  List<FocusNode> focus = [];
  List<bool> flagBorderColor = [];
  List<TextEditingController> controller = [];
  List<Widget> allItems = [];
  String? smsMessage;
  int count = 0;
  @override
  void initState() {
    super.initState();
    focus = List<FocusNode>.generate(6, (index) => FocusNode());
    flagBorderColor = List.generate(6, (index) => false);
    controller = generateControllers();
    generateTextFields();
    allItems = generateAll();
  }

  @override
  void dispose() {
    super.dispose();
    for (var i = 0; i < 6; i++) {
      controller[i].dispose();
      focus[i].dispose();
    }
  }

  void checkCountItems(int itemCount) {
    debugPrint('$itemCount');
    if (itemCount == 6) {
      focus.forEach((element) {
        element.unfocus();
      });
      context.read<OtpBloc>().add(OtpSendEvent());
    }
  }

  List<TextEditingController> generateControllers() {
    return List.generate(6, (index) {
      TextEditingController controller = TextEditingController();
      controller.addListener(() {
        if (controller.text.isNotEmpty) {
          setState(() {
            flagBorderColor[index] = !flagBorderColor[index];
          });
        } else {
          setState(() {
            flagBorderColor[index] = false;
          });
        }
      });
      return controller;
    });
  }

  void generateTextFields() {
    textField = List.generate(6, (int index) {
      return TextFieldData(
        controller[index],
        focus[index],
        (value) {
          if (value == '') {
            count--;
            if (index - 1 >= 0) {
              focus[index - 1].requestFocus();
            } else {
              for (var element in focus) {
                element.unfocus();
              }
            }
          } else {
            count++;
            checkCountItems(count);
            if (index + 1 < 6) {
              focus[index + 1].requestFocus();
            } else {
              for (var element in focus) {
                element.unfocus();
              }
            }
          }
        },
      );
    });
  }

  List<Widget> generateAll() {
    List<Widget> items = [];
    for (var i = 0; i < 6; i++) {
      items.add(SizedBox(
        height: 48.0,
        width: 48.0,
        child: textField[i],
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 328.0,
        height: 48.0,
        child: Stack(
          children: [
            BottomBorderContainer(flagBorderColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: allItems,
            ),
            BlocBuilder<OtpBloc, OtpState>(builder: ((context, state) {
              if (state is OtpSendState || state is OtpSuccessState) {
                return Container(
                    width: 328, height: 48.0, color: Colors.transparent);
              }
              return Center();
            }))
          ],
        ));
  }
}

final class BottomBorderContainer extends StatelessWidget {
  final List<bool> flagOfInidicator;
  const BottomBorderContainer(this.flagOfInidicator, {super.key});

  @override
  Widget build(BuildContext context) {
    return makeContainers();
  }

  Widget makeContainers() {
    List<Widget> dataItems = [];
    for (var i = 0; i < 6; i++) {
      dataItems.add(Container(
        height: 48.0,
        width: 48.0,
        decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(
                color: flagOfInidicator[i]
                    ? AppColors.onboardingPrimary
                    : AppColors.otline),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            boxShadow: [
              BoxShadow(
                  color: AppColors.internalShadow,
                  offset: const Offset(0.0, -1.0))
            ]),
      ));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: dataItems);
  }
}

class TextFieldData extends StatefulWidget {
  void Function(String? value) onchanged;
  TextEditingController controller;
  FocusNode node;
  TextFieldData(this.controller, this.node, this.onchanged, {super.key});

  @override
  State<TextFieldData> createState() => _TextFieldDataState();
}

class _TextFieldDataState extends State<TextFieldData> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.node,
      onChanged: widget.onchanged,
      onTap: () {
        setState(() {
          widget.controller.selection = TextSelection.fromPosition(
            TextPosition(
              offset: widget.controller.text.length,
            ),
          );
        });
      },
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      maxLength: 1,
      decoration: const InputDecoration(
        isDense: true,
        counterText: '',
        border: InputBorder.none,
      ),
      style: TextStyle(color: AppColors.text, fontSize: 18),
    );
  }
}
