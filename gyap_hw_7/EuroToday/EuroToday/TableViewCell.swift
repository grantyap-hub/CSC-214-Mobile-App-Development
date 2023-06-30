//
//  TableViewCell.swift
//  EuroToday
//
//  Created by Grant Yap on 11/22/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var LocalizedDateLabel: UILabel!
    @IBOutlet weak var CurrencyValueLabel: UILabel!
    @IBOutlet weak var CurrencyCodeLabel: UILabel!
    @IBOutlet weak var LeadingIndexLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
