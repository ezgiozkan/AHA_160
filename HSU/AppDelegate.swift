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
        
        let rootViewController = RootViewController(nibName: "RootViewController", bundle: .main) //TabBarController(nibName: "TabBarController", bundle: nil) 
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        window?.rootViewController = navigationController
       
        
        
        return true
    }

}

