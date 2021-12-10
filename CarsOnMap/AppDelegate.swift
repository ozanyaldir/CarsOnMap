//
//  AppDelegate.swift
//  CarsOnMap
//
//  Created by Ozan YALDIR on 27.11.2021.
//

import UIKit
import netfox
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        #if DEBUG
            NFX.sharedInstance().start()
        #endif
        return true
    }
}
