//
//  GCLandingPageRouterMock.swift
//  TheGettyCenterYelpTests
//
//  Created by Vandan Patel on 8/18/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

@testable import TheGettyCenterYelp
import UIKit

class GCLandingPageRouterMock: GCLandingPageRoutable {
    var numberOfTimesStartCalled = 0
    var numberOfTimesGoToReviewsCalled = 0
    
    var reviewsRouter: ReviewsTableViewRoutable {
        return ReviewsTableViewRouter(navigationController: UINavigationController())
    }
    
    func start(withAPI api: Router<YelpAPI>) {
        numberOfTimesStartCalled += 1
    }
    
    func goToReviewsTableView(withAPI api: Router<YelpAPI>) {
        numberOfTimesGoToReviewsCalled += 1
    }
}
