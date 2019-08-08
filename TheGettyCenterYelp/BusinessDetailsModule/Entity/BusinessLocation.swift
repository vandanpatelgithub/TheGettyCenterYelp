//
//  BusinessLocation.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/6/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

struct BusinessLocation: Codable, Equatable {
    let address1: String
    let address2: String
    let address3: String
    let city: String
    let zipcode: String
    let state: String
    let country: String
    
    private enum CodingKeys: String, CodingKey {
        case address1
        case address2
        case address3
        case city
        case zipcode = "zip_code"
        case state
        case country
    }
}
