//
//  AppDelegate.swift
//  SchoolDemo

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    static var shared : AppDelegate {
           return UIApplication.shared.delegate as! AppDelegate
    }
    


}
extension NSObject {
    
    var className : String {
        return String(describing: self)
    }
    
    static var className : String {
        return String(describing: self)
    }
}
