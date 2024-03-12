import 'package:flutter/material.dart';
import 'package:sheker/config/theme/theme_manager.dart';
import 'package:sheker/injection/injection_configure.dart';
import 'package:sheker/presentation/pages/home_page/settings/settings_table_model.dart';
import 'package:sheker/utilities/app_colors.dart';

class SettingsTable extends StatefulWidget {
  const SettingsTable({super.key});

  @override
  State<SettingsTable> createState() => _SettingsTableState();
}

class _SettingsTableState extends State<SettingsTable> {
  bool isActiveDark = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 2.0,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return makeTable(index);
          },
        ),
        const SizedBox(
          height: 24.0,
        ),
        makeLogOutButton(),
        const SizedBox(
          height: 24.0,
        )
      ],
    );
  }

  Widget makeTable(int index) {
    Widget header = makeHeaderText(SettingsTableModel.headerText[index]);
    Widget rows = makeRows(index);
    return Column(
      children: [header, rows],
    );
  }

  Widget makeHeaderText(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 17.0, top: 14.0, bottom: 8.0),
        child: Text(
          text,
          textAlign: TextAlign.right,
          style: TextStyle(color: AppColors.secondary, fontSize: 14.0),
        ),
      ),
    );
  }

  Widget makeRows(int sectionIndex) {
    int length = SettingsTableModel.contentRow[sectionIndex].length;
    List<String> data = SettingsTableModel.contentRow[sectionIndex];
    return SizedBox(
      width: MediaQuery.of(context).size.width - 31.0,
      height: 56.0 * length,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: length,
        itemBuilder: (context, index) {
          return makeContentRow(data[index],
              isFirst: index == 0,
              isLast: index == length - 1,
              isTheme: data[index] == 'Theme');
        },
      ),
    );
  }

  Widget makeContentRow(String text,
      {bool isTheme = false, bool isLast = false, bool isFirst = false}) {
    BorderRadius topRadius = const BorderRadius.only(
        topLeft: Radius.circular(14.0), topRight: Radius.circular(14.0));
    BorderRadius bottomRadius = const BorderRadius.only(
        bottomLeft: Radius.circular(14.0), bottomRight: Radius.circular(14.0));
    BorderRadius finalRadius = const BorderRadius.only();

    if (isFirst) {
      finalRadius = topRadius;
    }
    if (isLast) {
      finalRadius = bottomRadius;
    }
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 56.0,
          width: size.width,
          decoration: BoxDecoration(
              color: AppColors.surface, borderRadius: finalRadius),
          child: makeRow(isTheme, text),
        ),
        makeDivider(isLast)
      ],
    );
  }

  Widget makeRow(bool flag, String text) {
    if (flag) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 16.0, bottom: 16.0),
            child: Container(
              color: Colors.amber,
              width: 24.0,
              height: 24.0,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            text,
            style: TextStyle(color: AppColors.text, fontSize: 16.0),
          ),
          const Spacer(),
          Padding(
            padding:
                const EdgeInsets.only(top: 20.0, bottom: 20.0, right: 12.0),
            child: Text(
              'Dark mode',
              style: TextStyle(color: AppColors.secondary, fontSize: 14.0),
            ),
          ),
          Switch.adaptive(
              value: isActiveDark,
              activeColor: AppColors.onboardingPrimary,
              onChanged: (value) {
                setState(() {
                  isActiveDark = value;
                });
              }),
          const SizedBox(width: 14.0)
        ],
      );
    } else {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 16.0, bottom: 16.0),
            child: Container(
              color: Colors.amber,
              width: 24.0,
              height: 24.0,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            text,
            style: TextStyle(color: AppColors.text, fontSize: 16.0),
          )
        ],
      );
    }
  }

  Widget makeDivider(bool isLast) {
    return isLast
        ? const Center()
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 1,
                color: AppColors.surface,
                width: 43.0,
              ),
              Container(
                height: 1.0,
                width: MediaQuery.of(context).size.width - 43.0 - 31.0,
                color: AppColors.otline,
              ),
            ],
          );
  }

  Widget makeLogOutButton() {
    return SizedBox(
      height: 48.0,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              side: BorderSide(color: AppColors.onboardingPrimary, width: 2.0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)))),
          child: Text(
            'Log Out',
            style:
                TextStyle(color: AppColors.onboardingPrimary, fontSize: 16.0),
          )),
    );
  }
}
