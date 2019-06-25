//
//  BasicTableViewDatasourceProtocol.swift
//  BasicTableView
//
//  Created by David Thorn on 25.06.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import Foundation

public protocol BasicTableViewDatasourceProtocol {
    
    func load(completion: @escaping (_ items: [CellItem]) -> Void)
    
}
