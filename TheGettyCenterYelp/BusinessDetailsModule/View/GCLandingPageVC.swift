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
    let spinner = SpinnerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
        showActivity(child: spinner)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
    
    func loadNameComponent() {
        guard let nameComponent = NameComponentBuilder.buildNameComponent(withBusiness: self.uiModel) else { return }
        nameComponent.presenter.delegate = self.presenter
        nameComponent.presenter.loadNameComponent()
        stackView.addArrangedSubview(nameComponent)
    }
    
    func animateStackView() {
        stackView.transform = CGAffineTransform(translationX: -view.frame.width, y: 0)
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.stackView.transform = .identity
        }
    }
}

extension GCLandingPageVC: GCLandingPageViewable {
    func didGetBusinessDetails(withUIModel model: BusinessUIModel?) {
        guard let uiModel = model else { return }
        self.uiModel = uiModel
        DispatchQueue.main.async {
            self.hideActivity(child: self.spinner)
            self.animateStackView()
            self.loadNameComponent()
            self.loadHoursComponent()
            self.loadAddressComponent()
        }
    }
}
