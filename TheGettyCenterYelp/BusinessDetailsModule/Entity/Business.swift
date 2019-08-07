//
//  Business.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/6/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

struct Business: Codable {
    let name: String
    let imageURL: String
    let yelpURL: String
    let phoneNumber: String
    let rating: Double
    let location: BusinessLocation
    let photos: [String]
    let hours: [BusinessHours]
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
        case yelpURL = "url"
        case phoneNumber = "display_phone"
        case rating
        case location
        case photos
        case hours
    }
}
