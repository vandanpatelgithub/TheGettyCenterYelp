//
//  OpeningHours.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/6/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

struct OpeningHours: Codable, Equatable {
    var start: String
    var end: String
    let day: Int
}
