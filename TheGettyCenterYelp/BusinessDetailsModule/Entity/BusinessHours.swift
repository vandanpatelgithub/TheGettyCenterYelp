//
//  BusinessHours.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/6/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

struct BusinessHours: Codable, Equatable {
    let openingHours: [OpeningHours]
    
    private enum CodingKeys: String, CodingKey {
        case openingHours = "open"
    }
    
    static func == (lhs: BusinessHours, rhs: BusinessHours) -> Bool {
        return lhs.openingHours == rhs.openingHours
    }
}
