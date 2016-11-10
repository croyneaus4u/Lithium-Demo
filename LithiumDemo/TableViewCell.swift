//
//  TableViewCell.swift
//  LithiumDemo
//
//  Created by Lab kumar on 08/11/16.
//  Copyright © 2016 Lab kumar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var realeasedLabel: UILabel!
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        container.layer.cornerRadius = 5.0
        headerLabel.addBottomViewBorder(0.5, color: UIColor.lightGrayColor(), offset: CGPointMake(10.0, 10.0))
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
