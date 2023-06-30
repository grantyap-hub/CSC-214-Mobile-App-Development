//
//  DiaryCell.swift
//  P2
//
//  Created by Grant Yap on 10/25/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit

class DiaryCell: UITableViewCell {
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mileageLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with item: Item){
        if let title = item.value(forKey: "title") as? String,
            let purpose = item.value(forKey: "purpose") as? Int,
            let mileage = item.value(forKey: "mileage") as? Int,
            let duration = item.value(forKey: "duration") as? Int,
            let contact = item.value(forKey: "contacts") as? Int {
        
            titleLabel?.text = title
            mileageLabel?.text =  NSLocalizedString("Mileage: ", comment: "") + mileage.description
            durationLabel?.text =  NSLocalizedString("Duration: ", comment: "") + duration.description
            contactLabel?.text =  NSLocalizedString("Contacts: ", comment: "") + contact.description
            
//            NSLocalizedString("Mileage:", comment: "") +
//            NSLocalizedString("Duration:", comment: "") +
//            NSLocalizedString("Contacts:", comment: "") +
            if let purposeType = PurposeType(rawValue: purpose){
                typeImageView.image = purposeType.image()
            }
        }
    }

}
