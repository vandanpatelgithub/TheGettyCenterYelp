//
//  GCLandingPageVC.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/9/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

protocol GCLandingPageViewable {
    func didGetBusinessDetails(withResult result: Result<Business, Error>)
}

class GCLandingPageVC: UIViewController, Storyboarded {
    
    var presenter: GCLandingPagePresentable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
    }
}

extension GCLandingPageVC: GCLandingPageViewable {
    func didGetBusinessDetails(withResult result: Result<Business, Error>) {
        switch result {
        case let .success(business):
            print(business.name)
        case .failure(_):
            break
        }
    }
}
