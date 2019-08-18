//
//  ReviewsModuleViewMock.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/17/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import Foundation

class ReviewsModuleViewMock: ReviewsTableViewable {
    var numberOfTimesDisplayCalled = 0
    var reviews: [BusinessReview]?
    
    func display(reviews: [BusinessReview]) {
        numberOfTimesDisplayCalled += 1
        self.reviews = reviews
    }
}
