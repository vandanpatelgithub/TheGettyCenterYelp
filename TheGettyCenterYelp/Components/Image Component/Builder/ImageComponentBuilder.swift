//
//  ImageComponentBuilder.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/12/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

class ImageComponentBuilder {
    static func buildImageComponent(forBusiness business: BusinessUIModel, andAPI api: Router<YelpAPI>) -> ImageComponentView? {
        guard let view = Bundle.main.loadNibNamed("ImageComponentView", owner: nil, options: nil)?.first as? ImageComponentView else {
            return nil
        }
        let presenter = ImageComponentPresenter(view: view, business: business)
        let interactor = ImageComponentInteractor(networkManager: NetworkManager(router: api), presenter: presenter)
        view.presenter = presenter
        presenter.interactor = interactor
        return view
    }
}
