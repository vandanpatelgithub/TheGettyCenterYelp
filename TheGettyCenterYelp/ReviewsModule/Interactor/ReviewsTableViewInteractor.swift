//
//  ReviewsTableViewInteractor.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/16/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

protocol ReviewsTableViewInteractable: class {
    func getReviewsForBusiness(withID id: String)
}

class ReviewsTableViewInteractor {
    let presenter: ReviewsTableViewPresentable
    let networkManager: NetworkManagable
    
    init(presenter: ReviewsTableViewPresentable, networkManager: NetworkManagable) {
        self.presenter = presenter
        self.networkManager = networkManager
    }
}

extension ReviewsTableViewInteractor: ReviewsTableViewInteractable {
    func getReviewsForBusiness(withID id: String) {
        networkManager.getReviewsForBusiness(withID: id) { [weak self] (result) in
            self?.presenter.didGetBusinessReviews(withResult: result)
        }
    }
}
