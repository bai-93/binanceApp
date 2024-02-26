import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_statefull.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import '../../../utilities/app_colors.dart';

mixin BaseScreenVerificationMixin<T extends BaseScreen> on BaseScreenState<T> {
  Widget cameraLayer();
  Widget body();

  bool isActiveBottomSocialApp() {
    return false;
  }

  Widget showAlert() {
    return Container();
  }

  AppBar? _signUpAppbar() {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.backgroundWhiteTheme,
      title: Image.asset('lib/images/login/signup/coinmoney_appbar.png'),
    );
  }

  AppBar customAppbar() {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.black,
      title: const Text(
        'override !customAppbar! method',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  AppBar? _emptyAppBar(
      {Color? backgroundColor, Widget? title, Color? backButtonColor}) {
    return AppBar(
      title: title,
      surfaceTintColor: Colors.transparent,
      leading: BackButton(
        color: backButtonColor,
        style: const ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStatePropertyAll(Colors.transparent)),
      ),
      backgroundColor: backgroundColor ?? AppColors.backgroundWhiteTheme,
    );
  }

  AppBar? typeAppbar({AppbarType type = AppbarType.none}) {
    switch (type) {
      case AppbarType.signUp:
        return _signUpAppbar();
      case AppbarType.custom:
        return customAppbar();
      case AppbarType.empty:
        return _emptyAppBar();
      case AppbarType.none:
        return null;
      default:
        return null;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.paused:
        debugPrint('app is paused');
        break;
      case AppLifecycleState.inactive:
        debugPrint('app is inactive');
        break;
      case AppLifecycleState.resumed:
        debugPrint('app is resumed');
        break;
      case AppLifecycleState.detached:
        debugPrint('app is detached');
        break;
      default:
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    if (typeAppbar() != null) {
      return Stack(
        children: [
          cameraLayer(),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: typeAppbar(),
            body: body(),
          ),
        ],
      );
    } else {
      return Stack(children: [
        SingleChildScrollView(
            child: Column(
          children: [cameraLayer(), body()],
        )),
      ]);
    }
  }
}
