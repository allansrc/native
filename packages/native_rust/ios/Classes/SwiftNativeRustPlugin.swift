import Flutter
import UIKit

public class SwiftNativeRustPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "native_rust", binaryMessenger: registrar.messenger())
    let instance = SwiftNativeRustPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }

  // public func adderRust() {
  //   int64_t(2, 4)
  // }
}
