//
//  HoursComponentPresenterTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import XCTest

class HoursComponentPresenterTests: XCTestCase {
    
    var presenter: HoursComponentPresentable?
    let view = HoursComponentViewMock()
    let hours = [BusinessHoursUIModel(openingHours: [])]

    override func setUp() {
        super.setUp()
        presenter = HoursComponentPresenter(view: view, hours: hours)
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
        XCTAssertEqual(view.numberOfTimesDisplayCalled, 1)
        XCTAssertTrue(view.hours?.isEmpty ?? false)
    }
}
