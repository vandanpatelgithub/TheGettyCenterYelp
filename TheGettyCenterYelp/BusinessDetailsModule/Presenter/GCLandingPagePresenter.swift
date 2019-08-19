//
//  GCLandingPagePresenter.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/9/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

protocol GCLandingPagePresentable: NameComponentPresenterDelegate {
    func onViewDidLoad()
    func didGetBusinessDetails(withResult result: Result<Business, Error>)
    
    var interactor: GCLandingPageInteractable! { get set }
    var router: GCLandingPageRoutable? { get set }
}

class GCLandingPagePresenter {
    let view: GCLandingPageViewable
    var router: GCLandingPageRoutable?
    var api: Router<YelpAPI>?
    var interactor: GCLandingPageInteractable!
    
    init(view: GCLandingPageViewable, router: GCLandingPageRoutable? = nil, api: Router<YelpAPI>? = nil) {
        self.view = view
        self.router = router
        self.api = api
    }
}

extension GCLandingPagePresenter: GCLandingPagePresentable {
    func didGetBusinessDetails(withResult result: Result<Business, Error>) {
        switch result {
        case let .success(business):
            view.didGetBusinessDetails(withUIModel: business.convertToUIModel())
        case .failure(_):
            view.didGetBusinessDetails(withUIModel: nil)
        }
    }
    
    func onViewDidLoad() {
        interactor.getDetailsForBusiness(withID: "zRlDhJgcwXEphTUhMaCfyw")
    }
}

extension GCLandingPagePresenter: NameComponentPresenterDelegate {
    func didTapTopReviews() {
        guard let router = self.router, let api = self.api else { return }
        router.goToReviewsTableView(withAPI: api)
    }
}
