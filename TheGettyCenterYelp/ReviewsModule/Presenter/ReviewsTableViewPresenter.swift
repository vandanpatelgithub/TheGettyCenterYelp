//
//  ReviewsTableViewPresenter.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/16/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

protocol ReviewsTableViewPresentable: class {
    func loadReviews()
    func didGetBusinessReviews(withResult result: Result<BusinessReviews, Error>)
    
    var interactor: ReviewsTableViewInteractable! { get set }
}

class ReviewsTableViewPresenter {
    let view: ReviewsTableViewable
    var interactor: ReviewsTableViewInteractable!
    
    init(view: ReviewsTableViewable) {
        self.view = view
    }
}

extension ReviewsTableViewPresenter: ReviewsTableViewPresentable {
    func didGetBusinessReviews(withResult result: Result<BusinessReviews, Error>) {
        switch result {
        case let .success(businessReviews):
            view.display(reviews: businessReviews.reviews)
        case .failure(_):
            view.display(reviews: [])
        }
    }
    
    func loadReviews() {
        interactor.getReviewsForBusiness(withID: "zRlDhJgcwXEphTUhMaCfyw")
    }
}
