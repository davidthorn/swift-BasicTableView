//
//  BasicTableViewController.swift
//  BasicTableView
//
//  Created by David Thorn on 25.06.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import UIKit

public typealias CellItem = Any

open class BasicTableViewController: UIViewController {

    internal var datasource: BasicTableViewDatasourceProtocol!
    
    var items: [CellItem] = []

    lazy var que: DispatchQueue = {
        return DispatchQueue.init(label: "BasicTableViewController.sync.queue")
    }()
    
    internal func get(index: IndexPath) -> CellItem {
        return que.sync {
            return items[index.row]
        }
    }
    
    internal var numberOfItems: Int {
        return que.sync {
            return items.count
        }
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        self.tableview.register(BasicTableViewCell.nib, forCellReuseIdentifier: BasicTableViewCell.reuseIdentifier)
        
        self.datasource.load { (items) in
            
            self.que.sync {
                self.items = items
            }
            
            self.tableview.reloadData()
            
        }
        
    }

}


extension BasicTableViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.cell(item: get(index: indexPath), tableView: tableview, cellForRowAt: indexPath)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems
    }
    
    internal func cell(item: CellItem , tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier:  BasicTableViewCell.reuseIdentifier, for: indexPath) as! BasicTableViewCell
        cell.itemLabel.text = "Item \(indexPath.row)"
        return cell
    }
    
}

extension BasicTableViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
