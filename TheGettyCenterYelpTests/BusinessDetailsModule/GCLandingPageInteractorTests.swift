//
//  GCLandingPageInteractorTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import XCTest

class GCLandingPageInteractorTests: XCTestCase {
    
    var interactor: GCLandingPageInteractable?
    let networkManager = NetworkManagerMock()
    let presenter = GCLandingPagePresenterMock()

    override func setUp() {
        super.setUp()
        interactor = GCLandingPageInteractor(networkManager: networkManager, presenter: presenter)
    }

    override func tearDown() {
        interactor = nil
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertNotNil(interactor)
    }
    
    func testGetDetailsForBusinessForFailure() {
        interactor?.getDetailsForBusiness(withID: "")
        XCTAssertEqual(presenter.numberOfTimesGetBusinessDetailsCalled, 1)
        XCTAssertNil(presenter.business)
    }
    
    func testGetDetailsForBusinessForSuccess() {
        interactor?.getDetailsForBusiness(withID: "123")
        XCTAssertEqual(presenter.numberOfTimesGetBusinessDetailsCalled, 1)
        XCTAssertNotNil(presenter.business)
    }
}
