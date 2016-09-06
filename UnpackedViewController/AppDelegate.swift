//
//  AppDelegate.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.rootViewController = UINavigationController(rootViewController: LoginViewController())
        return window
    }()
    
    var realm: Realm?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        configureRealm()
        window!.makeKeyAndVisible()
        return true
    }
    
    func configureRealm() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(inMemoryIdentifier: "UnpackedViewControllerRealm")
        realm = try! Realm()
    }
}
