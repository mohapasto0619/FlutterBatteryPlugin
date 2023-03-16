import Flutter
import UIKit

public class BatteryIosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "battery_ios", binaryMessenger: registrar.messenger())
    let instance = BatteryIosPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch (call.method) {
        case "getBatteryPourcentage":
            UIDevice.current.isBatteryMonitoringEnabled = true
            let level = UIDevice.current.batteryLevel
            result(Int(level)*100)
        default:
            result(FlutterMethodNotImplemented)
    }
  }
}
