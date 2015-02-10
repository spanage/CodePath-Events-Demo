//
//  FilterCell.swift
//  FormsDemo
//
//  Created by Sommer Panage on 2/8/15.
//  Copyright (c) 2015 Sommer Panage. All rights reserved.
//

import UIKit

protocol FilterCellDelegate: class {
    func filterCell(filterCell: FilterCell, didChangeValue value: Bool)
}

class FilterCell: UITableViewCell {

    @IBOutlet weak var filterSwitch: UISwitch!
    @IBOutlet weak var filterLabel: UILabel!
    weak var delegate: FilterCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        filterSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueChanged() {
        delegate?.filterCell(self, didChangeValue: filterSwitch.on)
    }
}
