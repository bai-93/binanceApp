import 'package:hive/hive.dart';

mixin HiveHelperMixin {
  Future<void> saveData<T extends HiveObject>(T? data) async {
    data?.save;
  }
}
