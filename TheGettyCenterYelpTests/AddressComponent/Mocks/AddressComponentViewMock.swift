//
//  AddressComponentViewMock.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/11/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import Foundation

class AddressComponentViewMock: AddressComponentViewable {
    
    var numberOfTimesDisplayAddressCalled = 0
    var location: BusinessLocation?
    var phoneNumber: String?
    
    func displayAddress(_ location: BusinessLocation, _ phoneNumber: String) {
        numberOfTimesDisplayAddressCalled += 1
        self.location = location
        self.phoneNumber = phoneNumber
    }
}
