//
//  GCLandingPagePresenter.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/9/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

protocol GCLandingPagePresentable: class {
    func onViewDidLoad()
    func didGetBusinessDetails(withResult result: Result<Business, Error>)
}

class GCLandingPagePresenter {
    let view: GCLandingPageViewable
    var interactor: GCLandingPageInteractable!
    
    init(view: GCLandingPageViewable) {
        self.view = view
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
