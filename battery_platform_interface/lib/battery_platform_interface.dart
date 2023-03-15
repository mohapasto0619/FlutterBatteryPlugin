library battery_platform_interface;

import 'package:battery_platform_interface/method_channel_battery.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class BatteryPlatform extends PlatformInterface {
  BatteryPlatform() : super(token: _token);

  static final Object _token = Object();

  static BatteryPlatform _instance = MethodChannelBattery();

  static BatteryPlatform get instance => _instance;

  static set instance(BatteryPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Future<int?> getBatteryPourcentage();
}
