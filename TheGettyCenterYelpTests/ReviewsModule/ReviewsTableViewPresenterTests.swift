//
//  ReviewsTableViewPresenterTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/17/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import XCTest

class ReviewsTableViewPresenterTests: XCTestCase {
    
    var presenter: ReviewsTableViewPresentable?
    let view = ReviewsModuleViewMock()
    let interactor = ReviewsInteractorMock()

    override func setUp() {
        super.setUp()
        presenter = ReviewsTableViewPresenter(view: view)
        presenter?.interactor = interactor
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertNotNil(presenter)
    }
    
    func testGetReviews() {
        presenter?.loadReviews()
        XCTAssertEqual(interactor.numberOfTimesGetReviewsCalled, 1)
        XCTAssertEqual(interactor.id, "zRlDhJgcwXEphTUhMaCfyw")
    }
    
    func testDidGetBusinessReviewsForFailure() {
        presenter?.didGetBusinessReviews(withResult: .failure(MockError.invalidID))
        XCTAssertEqual(view.numberOfTimesDisplayCalled, 1)
        XCTAssertTrue(view.reviews?.isEmpty ?? false)
    }
    
    func testDidGetBusinessReviewsForSuccess() {
        presenter?.didGetBusinessReviews(withResult: .success(mockBusinessReviews))
        XCTAssertEqual(view.numberOfTimesDisplayCalled, 1)
        XCTAssertEqual(view.reviews?.count, 1)
        XCTAssertEqual(view.reviews?.first?.rating, 3.0)
    }
}
