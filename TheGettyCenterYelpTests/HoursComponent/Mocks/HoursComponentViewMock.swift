//
//  HoursComponentViewMock.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import Foundation

class HoursComponentViewMock: HoursComponentViewable {
    var numberOfTimesDisplayCalled = 0
    var hours: Set<OpeningHoursUIModel>?
    
    func display(hours: Set<OpeningHoursUIModel>) {
        numberOfTimesDisplayCalled += 1
        self.hours = hours
    }
}
