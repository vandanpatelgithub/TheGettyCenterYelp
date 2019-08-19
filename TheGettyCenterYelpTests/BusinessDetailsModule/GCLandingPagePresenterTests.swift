//
//  GCLandingPagePresenterTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import XCTest

class GCLandingPagePresenterTests: XCTestCase {
    
    var presenter: GCLandingPagePresentable?
    let view = GCLandingPageVCMock()
    let interactor = GCLandingPageInteractorMock()
    let router = GCLandingPageRouterMock()

    override func setUp() {
        super.setUp()
        presenter = GCLandingPagePresenter(view: view, router: self.router, api: Router<YelpAPI>())
        presenter?.interactor = self.interactor
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertNotNil(presenter)
    }
    
    func testOnViewDidLoad() {
        presenter?.onViewDidLoad()
        XCTAssertEqual(interactor.numberOfTimesGetDerailsForBusinessCalled, 1)
        XCTAssertEqual(interactor.id, "zRlDhJgcwXEphTUhMaCfyw")
    }
    
    func testDidGetBusinessDetailsForFailure() {
        presenter?.didGetBusinessDetails(withResult: .failure(MockError.invalidID))
        XCTAssertEqual(view.numberOfTimesGetBusinessDetailsCalled, 1)
        XCTAssertNil(view.model)
    }
    
    func testDidGetBusinessDetailsForSuccess() {
        presenter?.didGetBusinessDetails(withResult: .success(mockBusiness))
        XCTAssertEqual(view.numberOfTimesGetBusinessDetailsCalled, 1)
        XCTAssertNotNil(view.model)
    }
    
    func testDidTapReviews() {
        presenter?.didTapTopReviews()
        XCTAssertEqual(router.numberOfTimesGoToReviewsCalled, 1)
    }
}
