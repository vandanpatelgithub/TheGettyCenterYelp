//
//  NameComponentPresenterTests.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/14/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//


@testable import TheGettyCenterYelp
import XCTest

class NameComponentPresenterTests: XCTestCase {
    
    var presenter: NameComponentPresentable?
    let view = NameComponentViewMock()
    var numberOfTimesDidTapTopReviewsCalled = 0
    
    let mockBusinessUIModel = BusinessUIModel(name: "",
                                              imageURL: "",
                                              totalReviews: 0,
                                              yelpURL: "",
                                              phoneNumber: "",
                                              rating: 0.0,
                                              location: BusinessLocation(address1: "",
                                                                         address2: "",
                                                                         address3: "",
                                                                         city: "",
                                                                         zipcode: "",
                                                                         state: "",
                                                                         country: ""),
                                              photos: [],
                                              hours: [])

    override func setUp() {
        super.setUp()
        presenter = NameComponentPresenter(view: view, business: mockBusinessUIModel)
        presenter?.delegate = self
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertNotNil(presenter)
    }
    
    func testLoadNameComponent() {
        presenter?.loadNameComponent()
        XCTAssertEqual(view.numberOfTimesBusinessDetailsCalled, 1)
        guard let business = view.business else {
            XCTFail("view.businesss shouldn't be nil")
            return 
        }
        XCTAssertEqual(business, mockBusinessUIModel)
    }
    
    func testDidTapTopReviews() {
        presenter?.didTapTopReviews()
        XCTAssertEqual(numberOfTimesDidTapTopReviewsCalled, 1)
    }
}

extension NameComponentPresenterTests: NameComponentPresenterDelegate {
    func didTapTopReviews() {
        numberOfTimesDidTapTopReviewsCalled += 1
    }
}
