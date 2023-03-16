import 'package:battery_platform_interface/battery_platform_interface.dart';
import 'package:flutter/services.dart';

class BatteryIos extends BatteryPlatform {
  final methodChannelBattery = const MethodChannel('battery_ios');

  static void registerWith() {
    BatteryPlatform.instance = BatteryIos();
  }

  @override
  Future<int?> getBatteryPourcentage() {
    return methodChannelBattery.invokeMethod<int>('getBatteryPourcentage');
  }
}
