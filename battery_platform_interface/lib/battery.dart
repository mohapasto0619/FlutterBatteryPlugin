import 'package:battery_platform_interface/battery_api.dart';
import 'package:battery_platform_interface/battery_platform_interface.dart';
import 'package:flutter/services.dart';

class Battery extends BatteryPlatform {
  final api = BatteryApi();

  @override
  Future<int?> getBatteryPourcentage() {
    return api.getBatteryPourcentage();
  }
}
