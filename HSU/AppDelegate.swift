//
//  AppDelegate.swift
//  HSU
//
//  Created by ezgi on 13.03.2021.
//

import UIKit
import CoreData

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    
    static var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        AppDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        AppDelegate.window?.makeKeyAndVisible()
        
        let rootViewController = TabBarController(nibName: "TabBarController", bundle: nil) // RootViewController(nibName: "RootViewController", bundle: .main)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        AppDelegate.window?.rootViewController = navigationController
       
        
        
        return true
    }

}

