//
//  BusinessHours.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/6/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

struct BusinessHours: Codable {
    let openingHours: [OpeningHours]
    
    private enum CodingKeys: String, CodingKey {
        case openingHours = "open"
    }
}
