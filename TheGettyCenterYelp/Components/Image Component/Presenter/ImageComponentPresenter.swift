//
//  ImageComponentPresenter.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/12/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

protocol ImageComponentPresentable: class {
    func loadBusinessImage()
    func didLoadImageData(data: Data?)
}

class ImageComponentPresenter {
    
    let view: ImageComponentViewable
    var interactor: ImageComponentInteractable!
    let business: BusinessUIModel
    
    init(view: ImageComponentViewable, business: BusinessUIModel) {
        self.view = view
        self.business = business
    }
    
}

extension ImageComponentPresenter: ImageComponentPresentable {
    func didLoadImageData(data: Data?) {
        view.didLoadImageData(data: data)
    }
    
    func loadBusinessImage() {
        interactor.loadBusinessImage(forURL: self.business.imageURL)
    }
}
