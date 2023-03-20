import 'package:battery_platform_interface/battery_api.dart';
import 'package:battery_platform_interface/battery_platform_interface.dart';
import 'package:flutter/services.dart';

class BatteryAndroid extends BatteryPlatform {
  final api = BatteryApi();

  static void registerWith() {
    BatteryPlatform.instance = BatteryAndroid();
  }

  @override
  Future<int?> getBatteryPourcentage() {
    return api.getBatteryPourcentage();
  }
}
