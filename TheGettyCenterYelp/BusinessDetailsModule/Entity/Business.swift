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
    let totalReviews: Int
    
    private enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "image_url"
        case yelpURL = "url"
        case phoneNumber = "display_phone"
        case rating
        case location
        case photos
        case hours
        case totalReviews = "review_count"
    }
    
    func convertToUIModel() -> BusinessUIModel {
        let openingHours = self.hours.first?.openingHours.map { OpeningHoursUIModel(hours: $0) }
        return BusinessUIModel(
            name: self.name,
            imageURL: self.imageURL,
            totalReviews: self.totalReviews,
            yelpURL: self.yelpURL,
            phoneNumber: self.phoneNumber,
            rating: self.rating,
            location: self.location,
            photos: self.photos,
            hours: [BusinessHoursUIModel(openingHours: Set(openingHours ?? []))])
    }
}
