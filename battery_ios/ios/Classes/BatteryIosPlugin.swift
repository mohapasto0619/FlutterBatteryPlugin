import Flutter
import UIKit
import Foundation
import battery_ios

public class BatteryIosPlugin: NSObject, FlutterPlugin, BatteryApi {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : BatteryApi & NSObjectProtocol = BatteryIosPlugin.init()
        BatteryApiSetup.setUp(binaryMessenger: messenger, api: api)
    }

    func getBatteryPourcentage(completion: @escaping (Result<Int64, Error>) -> Void) {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let level = UIDevice.current.batteryLevel
        completion(Result.success(Int64(level * 100)))
    }

}
