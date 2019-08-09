//
//  GCLandingPageInteractor.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/9/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

protocol GCLandingPageInteractable: class {
    func getDetailsForBusiness(withID id: String)
}

class GCLandingPageInteractor {
    
    let networkManager: NetworkManagable
    let presenter: GCLandingPagePresentable
    
    init(networkManager: NetworkManagable, presenter: GCLandingPagePresentable) {
        self.networkManager = networkManager
        self.presenter = presenter
    }
    
}

extension GCLandingPageInteractor: GCLandingPageInteractable {
    func getDetailsForBusiness(withID id: String) {
        networkManager.getDetailsForBusiness(withID: id) { [weak self] (result) in
            self?.presenter.didGetBusinessDetails(withResult: result)
        }
    }
}
