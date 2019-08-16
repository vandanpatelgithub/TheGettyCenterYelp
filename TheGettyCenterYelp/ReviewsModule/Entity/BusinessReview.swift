//
//  BusinessReview.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/15/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

struct BusinessReview: Codable {
    let text: String
    let rating: Double
    let timeCreated: String
    let user: BusinessUser
    
    private enum CodingKeys: String, CodingKey {
        case text
        case rating
        case timeCreated = "time_created"
        case user
    }
}
