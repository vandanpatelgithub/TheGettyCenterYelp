//
//  ReviewsTableViewInteractorTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/18/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import XCTest

class ReviewsTableViewInteractorTests: XCTestCase {
    
    var interactor: ReviewsTableViewInteractable?
    let presenter = ReviewsPresenterMock()
    let networkManager = NetworkManagerMock()

    override func setUp() {
        super.setUp()
        interactor = ReviewsTableViewInteractor(presenter: presenter, networkManager: networkManager)
    }

    override func tearDown() {
        interactor = nil
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertNotNil(interactor)
    }
    
    func testGetReviewsForBusinessForFailure() {
        interactor?.getReviewsForBusiness(withID: "")
        XCTAssertEqual(presenter.numberOfTimesDidGetBusinessCalled, 1)
        XCTAssertNil(presenter.businessReviews)
    }
    
    func testGetReviewsForBusinessForSuccess() {
        interactor?.getReviewsForBusiness(withID: "123")
        XCTAssertEqual(presenter.numberOfTimesDidGetBusinessCalled, 1)
        XCTAssertNotNil(presenter.businessReviews)
    }
}
