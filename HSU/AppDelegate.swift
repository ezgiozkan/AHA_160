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


    
    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let rootViewController = RootViewController(nibName: "RootViewController", bundle: .main)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
       
        
        window?.rootViewController = navigationController
       
        
        
        return true
    }

}

