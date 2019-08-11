//
//  PhoneComponentCell.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/11/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

class PhoneComponentCell: UITableViewCell {
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populateCell(withPhoneNumber number: String) {
        phoneNumberLabel.text = number
    }
}
