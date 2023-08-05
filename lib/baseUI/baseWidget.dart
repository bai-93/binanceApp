import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T>
    with WidgetsBindingObserver {
  bool _isBack = true;
  bool _isCart = true;
  bool _isHiddenAppBar = false;

  set appBarIsHiddenSet(bool flag) => {_isHiddenAppBar = flag};
  bool get appBarIsHiddenGet => _isHiddenAppBar;

  String appBarTitle();

  void onClickBackButton();

  void onClickCart();

  set isBackButton(bool isBack) {
    debugPrint('BACK button is tapped');
    _isBack = isBack;
  }

  set isCartButton(bool isCart) {
    debugPrint('CART button is tapped');
    _isCart = isCart;
  }
}

mixin BaseScreenMixin<T extends BaseScreen> on BaseScreenState<T> {
  Widget body();
  AppBar? appBar() {
    return null;
  }

  Widget showAlert() {
    return Container();
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
    return Scaffold(
      appBar: appBar(),
      body: Stack(children: [
        body(),
        appBarIsHiddenGet
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent.withAlpha(100),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ])
            : Container(),
      ]),
    );
  }
}

class MyWidget extends BaseScreen {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends BaseScreenState<MyWidget> with BaseScreenMixin {
  @override
  Widget body() {
    appBarIsHiddenSet = true;
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('Hello world'),
      ),
    );
  }

  @override
  String appBarTitle() {
    return 'title for app bar';
  }

  @override
  void onClickBackButton() {
    debugPrint('go to Back screen');
  }

  @override
  void onClickCart() {
    debugPrint('go to Cart screen');
  }
}
