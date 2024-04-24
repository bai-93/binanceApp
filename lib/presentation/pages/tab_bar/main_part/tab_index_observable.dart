import 'package:injectable/injectable.dart';

@singleton
class TabIndexObserver {
  int _indexOfPage = 0;
  late Function(int) callback;

  void setIndex(int tabIndex) {
    _indexOfPage = tabIndex;
    callback(tabIndex);
  }

  int getIndex() {
    return _indexOfPage;
  }
}
