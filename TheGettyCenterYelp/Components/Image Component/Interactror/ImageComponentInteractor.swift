//
//  ImageComponentInteractor.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/12/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

protocol ImageComponentInteractable: class {
    func loadBusinessImage(forURL url: String)
}

class ImageComponentInteractor {
    let networkManager: NetworkManagable
    let presenter: ImageComponentPresentable
    
    init(networkManager: NetworkManagable, presenter: ImageComponentPresentable) {
        self.networkManager = networkManager
        self.presenter = presenter
    }
}

extension ImageComponentInteractor: ImageComponentInteractable {
    func loadBusinessImage(forURL url: String) {
        networkManager.loadImageData(forURL: url) { [weak self] (result) in
            switch result {
            case let .success(data):
                self?.presenter.didLoadImageData(data: data)
            case .failure(_):
                self?.presenter.didLoadImageData(data: nil)
            }
        }
    }
}
