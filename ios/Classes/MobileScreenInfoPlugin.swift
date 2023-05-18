import Flutter
import UIKit
import DevicePpi

public class MobileScreenInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mobile_screen_info", binaryMessenger: registrar.messenger())
    let instance = MobileScreenInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  let ppi: Double = {
        switch Ppi.get() {
        case .success(let ppi):
            return ppi
        case .unknown(let bestGuessPpi, let error):
            // A bestGuessPpi value is provided but may be incorrect
            // Treat as a non-fatal error -- e.g. log to your backend and/or display a message
            return bestGuessPpi
        }
    }()

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getScreenInfo":
            let data: [String: Any] = [
                "ppi": ppi,
                "width": UIScreen.main.bounds.size.width,
                "height": UIScreen.main.bounds.size.height,
                "scale": UIScreen().scale,
            ]
            result(data)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
