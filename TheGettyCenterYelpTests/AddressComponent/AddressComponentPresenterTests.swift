//
//  AddressComponentPresenterTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/11/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import XCTest

class AddressComponentPresenterTests: XCTestCase {
    
    var presenter: AddressComponentPresentable?
    let view = AddressComponentViewMock()
    let mockLocation = BusinessLocation(address1: "address1",
                                        address2: "address2",
                                        address3: "address3",
                                        city: "city",
                                        zipcode: "zipcode",
                                        state: "state",
                                        country: "country")
    let mockPhoneNumber = "(310) 555 5555"

    override func setUp() {
        super.setUp()
        presenter = AddressComponentPresenter(view: view, location: mockLocation, phoneNumber: mockPhoneNumber)
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertNotNil(presenter)
    }
    
    func testLoadData() {
        presenter?.loadData()
        XCTAssertEqual(view.numberOfTimesDisplayAddressCalled, 1)
        XCTAssertNotNil(view.location)
        XCTAssertNotNil(view.phoneNumber)
        XCTAssertEqual(view.location, mockLocation)
        XCTAssertEqual(view.phoneNumber, mockPhoneNumber)
    }
}
