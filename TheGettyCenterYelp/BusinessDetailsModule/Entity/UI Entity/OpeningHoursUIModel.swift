//
//  OpeningHoursUIModel.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/9/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

struct OpeningHoursUIModel: Hashable , Equatable {
    
    let start: String
    let end: String
    let day: DayOfTheWeek
    var hours: OpeningHours
    
    init(hours: OpeningHours) {
        self.hours = hours
        self.start = self.hours.start.getTwelveHourString() ?? ""
        self.end = self.hours.end.getTwelveHourString() ?? ""
        self.day = DayOfTheWeek(day: self.hours.day)
    }
}
