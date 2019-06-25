//
//  AppDelegate.swift
//  BasicTableViewFeature
//
//  Created by David Thorn on 25.06.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import UIKit
import BasicTableView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window?.rootViewController = BasicTableViewController.instance(datasource: self)?.inNavigationController()
        self.window?.makeKeyAndVisible()
        
        return true
    }

    

}

extension AppDelegate: BasicTableViewDatasourceProtocol {
    
    func load(completion: @escaping ([CellItem]) -> Void) {
        completion(["One" , "Two"])
    }
    
}

