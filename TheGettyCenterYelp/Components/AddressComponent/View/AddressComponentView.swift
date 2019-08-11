//
//  AddressComponentView.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/11/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

enum AddressComponentViewConstants: String {
    case cellID = "addressCell"
}

protocol AddressComponentViewable: class {
    func displayAddress(_ location: BusinessLocation)
}

class AddressComponentView: UIView {
    @IBOutlet weak var tableView: UITableView!
    
    var location: BusinessLocation?
    var presenter: AddressComponentPresenter!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "AddressComponentCell", bundle: nil),
                           forCellReuseIdentifier: AddressComponentViewConstants.cellID.rawValue)
    }
}

extension AddressComponentView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AddressComponentViewConstants.cellID.rawValue,
            for: indexPath) as? AddressComponentCell, let location = self.location else {
                return UITableViewCell()
        }
        cell.populateCell(withLocation: location)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Address"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0
    }
}

extension AddressComponentView: AddressComponentViewable {
    func displayAddress(_ location: BusinessLocation) {
        self.location = location
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
