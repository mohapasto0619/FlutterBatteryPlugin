import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'battery_ios_method_channel.dart';

abstract class BatteryIosPlatform extends PlatformInterface {
  /// Constructs a BatteryIosPlatform.
  BatteryIosPlatform() : super(token: _token);

  static final Object _token = Object();

  static BatteryIosPlatform _instance = MethodChannelBatteryIos();

  /// The default instance of [BatteryIosPlatform] to use.
  ///
  /// Defaults to [MethodChannelBatteryIos].
  static BatteryIosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BatteryIosPlatform] when
  /// they register themselves.
  static set instance(BatteryIosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
