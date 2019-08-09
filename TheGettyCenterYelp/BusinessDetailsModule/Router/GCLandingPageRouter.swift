//
//  GCLandingPageRouter.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/9/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

protocol GCLandingPageRoutable: class {
    func start(withAPI api: Router<YelpAPI>)
}

class GCLandingPageRouter {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private func initializeBusinessDetailModule(withAPI api: Router<YelpAPI>) -> GCLandingPageVC {
        let landingPageVC = GCLandingPageVC.instantiate()
        let presenter = GCLandingPagePresenter(view: landingPageVC)
        let interactor = GCLandingPageInteractor(networkManager: NetworkManager(router: api), presenter: presenter)
        landingPageVC.presenter = presenter
        presenter.interactor = interactor
        return landingPageVC
    }
}

extension GCLandingPageRouter: GCLandingPageRoutable {
    func start(withAPI api: Router<YelpAPI>) {
        let vc = initializeBusinessDetailModule(withAPI: api)
        navigationController.pushViewController(vc, animated: true)
    }
}
