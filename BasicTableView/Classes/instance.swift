//
//  instance.swift
//  BasicTableView
//
//  Created by David Thorn on 25.06.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import Foundation

extension BasicTableViewController {
    
    public static var storyboard: UIStoryboard {
        return UIStoryboard.init(name: "BasicTableView", bundle: Bundle.init(for: BasicTableViewController.self))
    }
    
    public static func instance(datasource: BasicTableViewDatasourceProtocol!) -> BasicTableViewController? {
        let vc = self.storyboard.instantiateInitialViewController() as? BasicTableViewController
        // add any dependenices in the instance method  as parameters
        vc?.datasource = datasource
        return vc
    }
    
    public func inNavigationController() -> UINavigationController {
        let nav = UINavigationController.init(rootViewController: self)
        /// do any styling here
        return nav
    }
    
}
