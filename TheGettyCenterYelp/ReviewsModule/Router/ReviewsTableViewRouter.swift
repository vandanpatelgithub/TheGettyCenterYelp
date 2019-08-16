//
//  ReviewsTableViewRouter.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/15/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

protocol ReviewsTableViewRoutable: class {
    func start(withAPI api: Router<YelpAPI>)
}

class ReviewsTableViewRouter {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private func initializeReviewsModule(withAPI api: Router<YelpAPI>) -> ReviewsTableViewController {
        let reviewsTVC = ReviewsTableViewController.instantiate()
        return reviewsTVC
    }
}

extension ReviewsTableViewRouter: ReviewsTableViewRoutable {
    func start(withAPI api: Router<YelpAPI>) {
        let tvc = initializeReviewsModule(withAPI: api)
        navigationController.pushViewController(tvc, animated: true)
    }
}
