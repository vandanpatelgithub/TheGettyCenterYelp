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
        title = "The Getty Center"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func loadImageComponent() {
        guard let imageComponent = ImageComponentBuilder.buildImageComponent(forBusiness: self.uiModel, andAPI: Router<YelpAPI>()) else { return }
        imageComponent.presenter.loadBusinessImage()
        stackView.addArrangedSubview(imageComponent)
    }
        
    func loadHoursComponent() {
        guard let hoursComponent = HoursComponentBuilder.buildHoursComponent(withHours: self.uiModel.hours) else { return }
        hoursComponent.presenter.loadData()
        stackView.addArrangedSubview(hoursComponent)
    }
    
    func loadAddressComponent() {
        guard let addressComponent = AddressComponentBuilder.buildAddressComponent(
            withLocation: uiModel.location,
            andPhoneNo: uiModel.phoneNumber) else {
            return
        }
        addressComponent.presenter.loadData()
        stackView.addArrangedSubview(addressComponent)
    }
}

extension GCLandingPageVC: GCLandingPageViewable {
    func didGetBusinessDetails(withUIModel model: BusinessUIModel?) {
        guard let uiModel = model else { return }
        self.uiModel = uiModel
        DispatchQueue.main.async {
            self.loadImageComponent()
            self.loadHoursComponent()
            self.loadAddressComponent()
        }
    }
}
