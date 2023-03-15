import 'package:battery_platform_interface/battery_platform_interface.dart';
import 'package:flutter/services.dart';

class BatteryAndroid extends BatteryPlatform {
  final methodChannelBattery = const MethodChannel('battery_android');

  static void registerWith() {
    BatteryPlatform.instance = BatteryAndroid();
  }

  @override
  Future<int?> getBatteryPourcentage() {
    return methodChannelBattery.invokeMethod<int>('getBatteryPourcentage');
  }
}
