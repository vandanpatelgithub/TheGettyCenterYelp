//
//  AddressComponentCell.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/11/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

class AddressComponentCell: UITableViewCell {
    @IBOutlet weak var address1Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func populateCell(withLocation location: BusinessLocation) {
        address1Label.text = location.address1
    }
}
