
import 'battery_ios_platform_interface.dart';

class BatteryIos {
  Future<String?> getPlatformVersion() {
    return BatteryIosPlatform.instance.getPlatformVersion();
  }
}
