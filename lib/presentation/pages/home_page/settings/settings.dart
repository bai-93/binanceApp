import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/config/theme/bloc/theme_bloc.dart';
import 'package:sheker/domain/entities/hive_services/user_service_hive.dart';
import 'package:sheker/presentation/pages/home_page/settings/settings_content.dart';
import 'package:sheker/presentation/pages/home_page/settings/settings_table_delegate.dart';
import 'package:sheker/utilities/app_colors.dart';

class Settings extends BaseScreenStateless
    implements SettingsDelegateActionsHandle {
  ScrollController controller =
      ScrollController(initialScrollOffset: UserServiceHive.getScrollOffset());
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
      style: Theme.of(buildContext!).textTheme.bodyLarge,
    );
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: SettingsContent(
        delegate: this,
      ),
    );
  }

  @override
  void selectedRows(String data, int indexSection, int index) {
    debugPrint("Settings main $data");
  }

  @override
  void selectedTheme(bool isDark) async {
    UserServiceHive.setScrollOffset(controller.offset);
    buildContext?.read<ThemeBloc>().add(ThemeChangeEvent(isDark));
  }

  @override
  void scrollPositions(double position) {}
}
