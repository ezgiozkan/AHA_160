//
//  AppDelegate.swift
//  HSU
//
//  Created by ezgi on 13.03.2021.
//

import UIKit
import CoreData


@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        if UserDefaults.standard.string(forKey: "token") != nil {
            
            let rootViewController = TabBarController(nibName: "TabBarController", bundle: .main)
            window?.rootViewController = rootViewController
            
        }else{
            
            let rootViewController = RootViewController(nibName: "RootViewController", bundle: .main)
            let navigationController = UINavigationController(rootViewController: rootViewController)
            
            window?.rootViewController = navigationController
        }
       
        
        
        return true
    }

}

