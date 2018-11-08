import UIKit
import Firebase
import SwiftyBeaver

let logger = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let path = Bundle.main.path(forResource: "GoogleService-Info-development", ofType: "plist")
        let options = FirebaseOptions(contentsOfFile: path!)
        FirebaseApp.configure(options: options!)
        return true
    }
}

