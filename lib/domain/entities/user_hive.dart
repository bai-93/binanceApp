import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user_hive.g.dart';

@HiveType(typeId: 0)
class UserHive extends HiveObject {
  @HiveField(0)
  late String email;

  @HiveField(1)
  late String idCardNumber;

  @HiveField(2)
  late bool isDark;
  @HiveField(3)
  late double scrollOffset;
  @HiveField(4)
  late bool isRegistered;

  UserHive(
      {this.email = '',
      this.idCardNumber = '',
      this.isDark = false,
      this.scrollOffset = 0.0,
      this.isRegistered = false});
}
