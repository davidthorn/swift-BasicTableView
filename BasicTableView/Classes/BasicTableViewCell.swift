//
//  BasicTableViewCell.swift
//  BasicTableView
//
//  Created by David Thorn on 25.06.19.
//  Copyright © 2019 David Thorn. All rights reserved.
//

import UIKit

open class BasicTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    public static var bundle: Bundle {
        return Bundle.init(for: self)
    }
    
    public static var nib: UINib? {
        return UINib.init(nibName: reuseIdentifier, bundle: bundle)
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        self.itemLabel.text = nil
    }
    
}
