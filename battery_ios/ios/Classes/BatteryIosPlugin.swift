import Flutter
import UIKit
import Foundation

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol BatteryApi {
  func getBatteryPourcentage() throws -> Int64
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class BatteryApiSetup {
  /// The codec used by BatteryApi.
  /// Sets up an instance of `BatteryApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: BatteryApi?) {
    let getBatteryPourcentageChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.BatteryApi.getBatteryPourcentage", binaryMessenger: binaryMessenger)
    if let api = api {
      getBatteryPourcentageChannel.setMessageHandler { _, reply in
        do {
          let result = try api.getBatteryPourcentage()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getBatteryPourcentageChannel.setMessageHandler(nil)
    }
  }
}


public class BatteryIosPlugin: NSObject, FlutterPlugin, BatteryApi {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : BatteryApi & NSObjectProtocol = BatteryIosPlugin.init()
        BatteryApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    func getBatteryPourcentage() throws -> Int64 {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let level = UIDevice.current.batteryLevel
        return Int64(level * 100)
    }

}
