//
//  GCLandingPageVCMock.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import Foundation

class GCLandingPageVCMock: GCLandingPageViewable {
    var model: BusinessUIModel?
    var numberOfTimesGetBusinessDetailsCalled = 0
    
    func didGetBusinessDetails(withUIModel model: BusinessUIModel?) {
        self.model = model
        numberOfTimesGetBusinessDetailsCalled += 1
    }
}

