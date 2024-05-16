import 'package:flutter/material.dart';
import 'package:sheker/domain/entities/hive_services/user_service_hive.dart';
import 'package:sheker/presentation/pages/home_page/settings/settings_table_delegate.dart';
import 'package:sheker/presentation/pages/home_page/settings/settings_table_model.dart';
import 'package:sheker/utilities/app_colors.dart';

class SettingsTable extends StatefulWidget {
  SettingsDelegateActionsHandle? delegate;
  SettingsTable({this.delegate, super.key});

  @override
  State<SettingsTable> createState() => _SettingsTableState();
}

class _SettingsTableState extends State<SettingsTable> {
  bool isActiveDark = UserServiceHive.getIsDarkTheme();

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
          style: TextStyle(color: AppColorsUtility.secondary, fontSize: 14.0),
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
              isTheme: data[index] == 'Theme',
              indexSection: sectionIndex,
              index: index);
        },
      ),
    );
  }

  Widget makeContentRow(String text,
      {bool isTheme = false,
      bool isLast = false,
      bool isFirst = false,
      int indexSection = 0,
      int index = 0}) {
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
    return GestureDetector(
      onTap: () {
        widget.delegate?.selectedRows(
            SettingsTableModel.contentRow[indexSection][index],
            indexSection,
            index);
      },
      child: Column(
        children: [
          Container(
            height: 56.0,
            width: size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: finalRadius),
            child: makeRow(isTheme, text,
                indexSection: indexSection, index: index),
          ),
          makeDivider(isLast)
        ],
      ),
    );
  }

  Widget makeRow(bool flag, String text,
      {int indexSection = 0, int index = 0}) {
    if (flag) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 16.0, bottom: 16.0),
            child: SizedBox(
              height: 24.0,
              width: 24.0,
              child: makeImageAsset(indexSection, index),
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const Spacer(),
          Padding(
            padding:
                const EdgeInsets.only(top: 20.0, bottom: 20.0, right: 12.0),
            child: Text(
              'Dark mode',
              style: TextStyle(color: AppColorsUtility.secondary, fontSize: 14.0),
            ),
          ),
          Switch.adaptive(
              value: isActiveDark,
              activeColor: AppColorsUtility.onboardingPrimary,
              onChanged: (value) {
                setState(() {
                  isActiveDark = value;
                  widget.delegate?.selectedTheme(isActiveDark);
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
            child: SizedBox(
              height: 24.0,
              width: 24.0,
              child: makeImageAsset(indexSection, index),
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const Spacer(),
          Padding(
              padding:
                  const EdgeInsets.only(top: 20.79, bottom: 20.79, right: 14.0),
              child: SizedBox(
                  width: 8.12,
                  height: 14.41,
                  child: Image.asset('lib/images/home/settings/arrow.png')))
        ],
      );
    }
  }

  Widget makeImageAsset(int indexSection, int index) {
    String value = SettingsTableModel.iconsImages[indexSection][index];
    return Image.asset('lib/images/home/settings/$value.png');
  }

  Widget makeDivider(bool isLast) {
    return isActiveDark
        ? const Center()
        : isLast
            ? const Center()
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 1,
                    color: AppColorsUtility.surface,
                    width: 43.0,
                  ),
                  Container(
                    height: 1.0,
                    width: MediaQuery.of(context).size.width - 43.0 - 31.0,
                    color: AppColorsUtility.otline,
                  ),
                ],
              );
  }
}
