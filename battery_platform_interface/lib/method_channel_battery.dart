import 'package:battery_platform_interface/battery_api.dart';
import 'package:battery_platform_interface/battery_platform_interface.dart';
import 'package:flutter/services.dart';

class MethodChannelBattery extends BatteryPlatform {
  final methodChannelBattery = BatteryApi();

  @override
  Future<int?> getBatteryPourcentage() {
    return methodChannelBattery.getBatteryPourcentage();
  }
}
