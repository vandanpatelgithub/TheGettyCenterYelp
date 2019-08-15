//
//  NameComponentViewMock.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/14/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import Foundation

class NameComponentViewMock: NameComponentViewable {
    var numberOfTimesBusinessDetailsCalled = 0
    var business: BusinessUIModel?
    
    func didGetBusinessDetails(withBusiness business: BusinessUIModel) {
        numberOfTimesBusinessDetailsCalled += 1
        self.business = business
    }
}

