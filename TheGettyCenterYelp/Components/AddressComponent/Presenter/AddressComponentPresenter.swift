//
//  AddressComponentPresenter.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/11/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

protocol AddressComponentPresentable: class {
    func loadData()
}

class AddressComponentPresenter {
    let view: AddressComponentViewable
    let location: BusinessLocation
    
    init(view: AddressComponentViewable, location: BusinessLocation) {
        self.view = view
        self.location = location
    }
}

extension AddressComponentPresenter: AddressComponentPresentable {
    func loadData() {
        view.displayAddress(self.location)
    }
}
