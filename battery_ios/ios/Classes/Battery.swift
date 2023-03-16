// Autogenerated from Pigeon (v9.0.7), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif



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
protocol PrctBatteryApi {
  func getBatteryPourcentage(completion: @escaping (Result<Int64, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class PrctBatteryApiSetup {
  /// The codec used by PrctBatteryApi.
  /// Sets up an instance of `PrctBatteryApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: PrctBatteryApi?) {
    let getBatteryPourcentageChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.PrctBatteryApi.getBatteryPourcentage", binaryMessenger: binaryMessenger)
    if let api = api {
      getBatteryPourcentageChannel.setMessageHandler { _, reply in
        api.getBatteryPourcentage() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      getBatteryPourcentageChannel.setMessageHandler(nil)
    }
  }
}
