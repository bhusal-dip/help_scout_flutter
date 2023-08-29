import Flutter
import UIKit
import Beacon
import Foundation
import UIKit

public class HelpScoutFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "help_scout_flutter", binaryMessenger: registrar.messenger())
    let instance = HelpScoutFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let arguments = call.arguments as? NSDictionary
    
    switch call.method {
    case "initialize":
      initializeBeacon(arguments: arguments!)
      result("Beacon successfully initialized")
      break;
    case "openBeacon":
      let beaconId = arguments!["beaconId"] as? String
      openBeacon(beaconId: beaconId!)
      break;
    case "clearBeacon":
      clearBeacon()
      result("Beacon cleared successfully!")
      break;
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  public func initializeBeacon(arguments: NSDictionary) {
    let email = arguments["email"] as? String
    let name = arguments["name"] as? String
    let avatar = arguments["avatar"] as? URL
    let company = arguments["company"] as? String
    let jobTitle = arguments["jobTitle"] as? String
        
    let user = HSBeaconUser()
    user.email = email
    user.name = name
    user.avatar = avatar
    user.company = company
    user.jobTitle = jobTitle
        
    HSBeacon.identify(user)
  }
    
  public func openBeacon(beaconId: String) {
    let settings = HSBeaconSettings(beaconId: beaconId)
    HSBeacon.open(settings)
  }
    
  public func clearBeacon() {
    HSBeacon.reset()
  }
}
