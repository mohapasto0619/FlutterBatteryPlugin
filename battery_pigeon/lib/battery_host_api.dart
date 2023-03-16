import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class PrctBatteryApi {
  @async
  int getBatteryPourcentage();
}
