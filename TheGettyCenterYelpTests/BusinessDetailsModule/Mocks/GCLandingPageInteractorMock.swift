//
//  GCLandingPageInteractorMock.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import Foundation

class GCLandingPageInteractorMock: GCLandingPageInteractable {
    var numberOfTimesGetDerailsForBusinessCalled = 0
    var id = ""
    
    func getDetailsForBusiness(withID id: String) {
        numberOfTimesGetDerailsForBusinessCalled += 1
        self.id = id
    }
}
