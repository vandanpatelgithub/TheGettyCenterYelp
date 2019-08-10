//
//  BusinessUIModel.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/9/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

struct BusinessUIModel {
    let name: String
    let imageURL: String
    let yelpURL: String
    let phoneNumber: String
    let rating: Double
    let location: BusinessLocation
    let photos: [String]
    let hours: [BusinessHoursUIModel]
}
