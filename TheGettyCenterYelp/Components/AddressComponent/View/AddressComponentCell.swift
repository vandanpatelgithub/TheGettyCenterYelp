//
//  AddressComponentCell.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/11/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

class AddressComponentCell: UITableViewCell {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var address1Label: UILabel!
    @IBOutlet weak var address2Label: UILabel!
    @IBOutlet weak var address3Label: UILabel!
    @IBOutlet weak var cityStateZipLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    fileprivate func addRemoveAddress1Label(_ location: BusinessLocation) {
        if !location.address1.isEmpty {
            address1Label.text = location.address1
        } else {
            stackView.removeArrangedSubview(address1Label)
        }
    }
    
    fileprivate func addRemoveAddress2Label(_ location: BusinessLocation) {
        if !location.address2.isEmpty {
            address2Label.text = location.address2
        } else {
            stackView.removeArrangedSubview(address2Label)
        }
    }
    
    fileprivate func addRemoveAddress3Label(_ location: BusinessLocation) {
        if !location.address3.isEmpty {
            address3Label.text = location.address3
        } else {
            stackView.removeArrangedSubview(address3Label)
        }
    }
    
    fileprivate func addCityStateZipLabel(_ location: BusinessLocation) {
        cityStateZipLabel.text = "\(location.city), \(location.state) \(location.zipcode)"
    }
    
    func populateCell(withLocation location: BusinessLocation) {
        addRemoveAddress1Label(location)
        addRemoveAddress2Label(location)
        addRemoveAddress3Label(location)
        addCityStateZipLabel(location)
    }
}
