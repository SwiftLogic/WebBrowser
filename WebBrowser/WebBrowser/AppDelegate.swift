//
//  AppDelegate.swift
//  WebBrowser
//
//  Created by Osaretin Uyigue on 9/9/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        let navController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navController
        return true
    }



}

