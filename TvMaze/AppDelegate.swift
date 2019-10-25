//
//  AppDelegate.swift
//  TvMaze
//
//  Created by Fabrizio Sposetti on 08/10/2019.
//  Copyright © 2019 Fabrizio Sposetti. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let submodules: TabBarRouter.Submdoules = (
            shows: MazeModule.createListShowModule(usingNavigationFactory: NavigationBuilder.build),
            persons: MazeModule.createPersonSearchModule(usingNavigationFactory: NavigationBuilder.build))
            
        let tabBarController = MazeModule.createTabBarModule(usingSubModules: submodules)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
}

