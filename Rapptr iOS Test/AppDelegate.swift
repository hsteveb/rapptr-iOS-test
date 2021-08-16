//
//  AppDelegate.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 13.0, *) {
        } else {
            //print("here")
            let window = UIWindow(frame: UIScreen.main.bounds)
            let navigationController = UINavigationController(rootViewController: MenuViewController(nibName: "MenuViewController", bundle: nil))
            let image = UIImage()
            navigationController.navigationBar.setBackgroundImage(image, for: .default)
            navigationController.navigationBar.shadowImage = UIImage()
            navigationController.navigationBar.isTranslucent = false
            navigationController.navigationBar.barTintColor = UIColor(named: "primary_blue")
            navigationController.navigationBar.barStyle = .black
            navigationController.navigationBar.tintColor = UIColor(named: "white")
            
            //navigationController.navigationBar.clipsToBounds = false
            
            //navigationController.navigationBar.backgroundColor = UIColor(named: "primary_blue")
            
            
            
            
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            self.window = window
           
        }
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}

