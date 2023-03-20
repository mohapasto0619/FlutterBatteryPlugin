import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class BatteryApi {
  @async
  int getBatteryPourcentage();
}
