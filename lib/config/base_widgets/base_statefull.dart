import 'package:flutter/material.dart';
import 'package:sheker/config/base_widgets/base_stateless.dart';
import 'package:sheker/utilities/app_colors.dart';

typedef onPress = void Function()?;

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T>
    with WidgetsBindingObserver {
  Size sizeOfScreen() {
    return Size(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
  }
}

mixin BaseScreenMixin<T extends BaseScreen> on BaseScreenState<T> {
  Widget body();

  bool isActiveBottomSocialApp() {
    return false;
  }

  Widget showAlert() {
    return Container();
  }

  Widget? leadingAppBar() {
    return null;
  }

  List<Widget>? actionsAppBar() {
    return null;
  }

  Widget? title() {
    return null;
  }

  AppBar? _signUpAppbar() {
    return AppBar(
      leading: leadingAppBar(),
      actions: actionsAppBar(),
      surfaceTintColor: Colors.transparent,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Center(
          child: title() ??
              Image.asset('lib/images/login/signup/coinmoney_appbar.png')),
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
            overlayColor: WidgetStatePropertyAll(Colors.transparent)),
      ),
      backgroundColor: backgroundColor ?? AppColorsUtility.lightBackground,
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

  Widget bottomSocialApp({onPress facebook, onPress apple, onPress google}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                color: AppColorsUtility.otline,
                height: 1,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              'or continue with?',
              style: TextStyle(color: AppColorsUtility.text, fontSize: 14.0),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Flexible(
              child: Container(
                color: AppColorsUtility.otline,
                height: 1,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 36.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _makeSocialBottomButton(
                callback: facebook, nameImage: 'facebook_social'),
            const SizedBox(
              width: 32.0,
            ),
            _makeSocialBottomButton(callback: apple, nameImage: 'apple_social'),
            const SizedBox(
              width: 32.0,
            ),
            _makeSocialBottomButton(
                callback: google, nameImage: 'google_social')
          ],
        )
      ],
    );
  }

  Widget _makeSocialBottomButton({onPress callback, String nameImage = ''}) {
    return GestureDetector(
      onTap: callback,
      child: Image.asset(
        'lib/images/login/signup/$nameImage.png',
        width: 48.0,
        height: 48.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (typeAppbar() != null) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: typeAppbar(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            body(),
            isActiveBottomSocialApp()
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 98),
                    child: bottomSocialApp(),
                  )
                : Container(),
          ],
        )),
      );
    } else {
      return SingleChildScrollView(
          child: Column(
        children: [
          body(),
          isActiveBottomSocialApp()
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 98),
                  child: bottomSocialApp(),
                )
              : Container()
        ],
      ));
    }
  }
}
