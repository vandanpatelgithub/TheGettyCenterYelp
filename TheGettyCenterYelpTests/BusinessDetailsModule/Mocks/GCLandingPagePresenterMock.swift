//
//  GCLandingPagePresenterMock.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import Foundation

class GCLandingPagePresenterMock: GCLandingPagePresentable {
    var router: GCLandingPageRoutable?
    var interactor: GCLandingPageInteractable!
    var numberOfTimesOnViewDidLoadCalled = 0
    var numberOfTimesGetBusinessDetailsCalled = 0
    var business: Business?
    var numberOfTimesDidTapTopReviewsCalled = 0
    
    func onViewDidLoad() {
        numberOfTimesOnViewDidLoadCalled += 1
    }
    
    func didGetBusinessDetails(withResult result: Result<Business, Error>) {
        numberOfTimesGetBusinessDetailsCalled += 1
        switch result {
        case let .success(business):
            self.business = business
        case .failure(_):
            self.business = nil
        }
    }
    
    func didTapTopReviews() {
        numberOfTimesDidTapTopReviewsCalled += 1
    }
}
