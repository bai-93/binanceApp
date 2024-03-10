import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/presentation/pages/home_page/settings/settings_content.dart';
import 'package:sheker/utilities/app_colors.dart';

class Settings extends BaseScreenStateless {
  Settings({super.key});

  @override
  AppBar? typeOfAppbar({AppbarType type = AppbarType.none}) {
    return super.typeOfAppbar(type: AppbarType.signUp);
  }

  @override
  List<Widget>? actionsAppBar() {
    return [
      IconButton(
          onPressed: () {},
          icon: Image.asset('lib/images/home/settings/search.png'))
    ];
  }

  @override
  Widget? leadingAppBar() {
    return BackButton(
      color: AppColors.secondary,
    );
  }

  @override
  Widget? title() {
    return Text(
      'Settings',
      style: TextStyle(color: AppColors.text, fontSize: 18.0),
    );
  }

  @override
  Widget body(BuildContext context) {
    return const SettingsContent();
  }
}
