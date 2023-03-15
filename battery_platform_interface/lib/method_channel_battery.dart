import 'package:battery_platform_interface/battery_platform_interface.dart';
import 'package:flutter/services.dart';

class MethodChannelBattery extends BatteryPlatform {
  final methodChannelBattery = const MethodChannel('battery');

  @override
  Future<int?> getBatteryPourcentage() {
    return methodChannelBattery.invokeMethod<int>('getBatteryPourcentage');
  }
}
