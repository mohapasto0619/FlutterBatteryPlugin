import 'package:flutter_test/flutter_test.dart';
import 'package:battery_ios/battery_ios.dart';
import 'package:battery_ios/battery_ios_platform_interface.dart';
import 'package:battery_ios/battery_ios_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBatteryIosPlatform
    with MockPlatformInterfaceMixin
    implements BatteryIosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BatteryIosPlatform initialPlatform = BatteryIosPlatform.instance;

  test('$MethodChannelBatteryIos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBatteryIos>());
  });

  test('getPlatformVersion', () async {
    BatteryIos batteryIosPlugin = BatteryIos();
    MockBatteryIosPlatform fakePlatform = MockBatteryIosPlatform();
    BatteryIosPlatform.instance = fakePlatform;

    expect(await batteryIosPlugin.getPlatformVersion(), '42');
  });
}
