//
//  NameComponentPresenter.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/14/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

protocol NameComponentPresentable: class {
    func loadNameComponent()
    func didTapGoToWebsite()
}

class NameComponentPresenter {
    let view: NameComponentViewable
    let business: BusinessUIModel
    
    init(view: NameComponentViewable, business: BusinessUIModel) {
        self.view = view
        self.business = business
    }
}

extension NameComponentPresenter: NameComponentPresentable {
    func didTapGoToWebsite() {
        openUrl(urlString: self.business.yelpURL)
    }
    
    func loadNameComponent() {
        view.didGetBusinessDetails(withBusiness: self.business)
    }
    
    private func openUrl(urlString: String) {
        if let url = URL(string: urlString), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
