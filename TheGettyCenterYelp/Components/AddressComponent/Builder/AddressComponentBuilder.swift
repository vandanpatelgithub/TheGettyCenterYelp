//
//  AddressComponentBuilder.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/11/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

class AddressComponentBuilder {
    static func buildAddressComponent(withLocation location: BusinessLocation, andPhoneNo phone: String) -> AddressComponentView? {
        guard let view = Bundle.main.loadNibNamed("AddressComponentView", owner: nil, options: nil)?.first as? AddressComponentView else {
            return nil
        }
        let presenter = AddressComponentPresenter(view: view, location: location, phoneNumber: phone)
        view.presenter = presenter
        return view
    }
}
