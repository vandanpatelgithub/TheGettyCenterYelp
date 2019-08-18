//
//  ReviewsPresenterMock.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/18/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import Foundation

class ReviewsPresenterMock: ReviewsTableViewPresentable {
    
    var interactor: ReviewsTableViewInteractable!
    var numberOfTimesLoadReviewsCalled = 0
    var numberOfTimesDidGetBusinessCalled = 0
    var businessReviews: BusinessReviews?
    
    func loadReviews() {
        numberOfTimesLoadReviewsCalled += 1
    }
    
    func didGetBusinessReviews(withResult result: Result<BusinessReviews, Error>) {
        numberOfTimesDidGetBusinessCalled += 1
        switch result {
        case let .success(businessReviews):
            self.businessReviews = businessReviews
        case .failure(_):
            self.businessReviews = nil
        }
    }
}
