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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return makeHeaderText(SettingsTableModel.headerText[index]);
          },
        ),
        const SizedBox(
          height: 24.0,
        ),
        makeLogOutButton()
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

  Widget makeHeaderText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, top: 16.0),
      child: Text(
        text,
        style: TextStyle(color: AppColors.secondary, fontSize: 14.0),
      ),
    );
  }

  Widget makeRows(int index) {
    int length = SettingsTableModel.contentRow[index].length;
    List<String> data = SettingsTableModel.contentRow[index];
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: length,
      itemBuilder: (context, index) {
        return makeContentRow(data[index],
            isFirst: index == 0, isLast: index == length - 1);
      },
    );
  }

  Widget makeContentRow(String text,
      {bool isTheme = false, bool isLast = true, bool isFirst = true}) {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface),
    );
  }
}
