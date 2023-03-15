library battery;

import 'package:battery_platform_interface/battery_platform_interface.dart';

BatteryPlatform get _platform => BatteryPlatform.instance;

Future<int> getBatteryPourcentage() async {
  final batteryPourcentage = await _platform.getBatteryPourcentage();
  if (batteryPourcentage == null) {
    throw Exception('Unable to get battery pourcentage');
  }
  return batteryPourcentage;
}
