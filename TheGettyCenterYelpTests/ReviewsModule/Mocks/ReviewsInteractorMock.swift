//
//  ReviewsInteractorMock.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/17/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import Foundation

class ReviewsInteractorMock: ReviewsTableViewInteractable {
    var numberOfTimesGetReviewsCalled = 0
    var id = ""
    
    func getReviewsForBusiness(withID id: String) {
        numberOfTimesGetReviewsCalled += 1
        self.id = id
    }
}
