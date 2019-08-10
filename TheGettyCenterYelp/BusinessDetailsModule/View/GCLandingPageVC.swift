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
    
    @IBOutlet weak var stackView: UIStackView!
    
    var presenter: GCLandingPagePresentable!
    var uiModel: BusinessUIModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
    }
    
    func loadHoursComponent() {
        guard let hoursComponent = HoursComponentBuilder.buildHoursComponent(withHours: self.uiModel.hours) else { return }
        hoursComponent.presenter.loadData()
        stackView.addArrangedSubview(hoursComponent)
    }
}

extension GCLandingPageVC: GCLandingPageViewable {
    func didGetBusinessDetails(withUIModel model: BusinessUIModel?) {
        guard let uiModel = model else { return }
        self.uiModel = uiModel
        DispatchQueue.main.async {
            self.loadHoursComponent()
        }
    }
}
