import Flutter
import UIKit
import Foundation

public class BatteryIosPlugin: NSObject, FlutterPlugin, PrctBatteryApi {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : PrctBatteryApi & NSObjectProtocol = BatteryIosPlugin.init()
        PrctBatteryApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    func getBatteryPourcentage(completion: @escaping (Result<Int64, Error>) -> Void) {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let level = UIDevice.current.batteryLevel
        completion(Result.success(Int64(level * 100)))
    }

}
