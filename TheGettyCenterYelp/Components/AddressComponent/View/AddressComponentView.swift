//
//  AddressComponentView.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/11/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

enum AddressComponentViewConstants: String {
    case addressCellID = "addressCell"
    case phoneCellID = "phoneCell"
}

protocol AddressComponentViewable: class {
    func displayAddress(_ location: BusinessLocation, _ phoneNumber: String)
}

class AddressComponentView: UIView {
    @IBOutlet weak var tableView: ContentSizedTableView!
    
    var location: BusinessLocation?
    var phoneNumber: String?
    var presenter: AddressComponentPresenter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "AddressComponentCell", bundle: nil),
                           forCellReuseIdentifier: AddressComponentViewConstants.addressCellID.rawValue)
        tableView.register(UINib(nibName: "PhoneComponentCell", bundle: nil),
                           forCellReuseIdentifier: AddressComponentViewConstants.phoneCellID.rawValue)
    }
}

extension AddressComponentView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let phoneNo = self.phoneNumber, !phoneNo.isEmpty else { return 1 }
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AddressComponentViewConstants.addressCellID.rawValue,
                for: indexPath) as? AddressComponentCell, let location = self.location else {
                    return UITableViewCell()
            }
            cell.populateCell(withLocation: location)
            cell.separatorInset = UIEdgeInsets.zero
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AddressComponentViewConstants.phoneCellID.rawValue,
                for: indexPath) as? PhoneComponentCell, let phoneNumber = phoneNumber else {
                    return UITableViewCell()
            }
            cell.separatorInset = UIEdgeInsets.zero
            cell.populateCell(withPhoneNumber: phoneNumber)
            return cell
        default:
            return UITableViewCell()
        }
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Address"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0
    }
}

extension AddressComponentView: AddressComponentViewable {
    func displayAddress(_ location: BusinessLocation, _ phoneNumber: String) {
        self.location = location
        self.phoneNumber = phoneNumber
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
