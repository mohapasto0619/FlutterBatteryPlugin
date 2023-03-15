import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'battery_ios_platform_interface.dart';

/// An implementation of [BatteryIosPlatform] that uses method channels.
class MethodChannelBatteryIos extends BatteryIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('battery_ios');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
