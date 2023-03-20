import 'package:battery_platform_interface/battery_api.dart';
import 'package:battery_platform_interface/battery_platform_interface.dart';
import 'package:flutter/services.dart';

class BatteryIos extends BatteryPlatform {
  final api = BatteryApi();

  static void registerWith() {
    BatteryPlatform.instance = BatteryIos();
  }

  @override
  Future<int?> getBatteryPourcentage() {
    return api.getBatteryPourcentage();
  }
}
