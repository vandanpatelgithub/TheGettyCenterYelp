//
//  GCLandingPageVC.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/9/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

protocol GCLandingPageViewable {
    func didGetBusinessDetails(withUIModel model: BusinessUIModel?)
}

class GCLandingPageVC: UIViewController, Storyboarded {
    
    var presenter: GCLandingPagePresentable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
    }
}

extension GCLandingPageVC: GCLandingPageViewable {
    func didGetBusinessDetails(withUIModel model: BusinessUIModel?) {
        guard let uiModel = model else { return }
        print(uiModel.hours.first?.openingHours.first?.start ?? "")
    }
}
