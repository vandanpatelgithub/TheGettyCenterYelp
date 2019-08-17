//
//  NameComponentView.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/14/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

protocol NameComponentViewable: class {
    func didGetBusinessDetails(withBusiness business: BusinessUIModel)
}

class NameComponentView: UIView {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var businessNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var totalReviewsLabel: UILabel!
    
    
    var presenter: NameComponentPresentable!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.dropShadow()
        containerView.layer.cornerRadius = 5.0
    }
    
    @IBAction func didTapGoToWebsite(_ sender: UIButton) {
        presenter.didTapGoToWebsite()
    }
    
    @IBAction func didTapTopReviews(_ sender: UIButton) {
        presenter.didTapTopReviews()
    }
}

extension NameComponentView: NameComponentViewable {
    func didGetBusinessDetails(withBusiness business: BusinessUIModel) {
        businessNameLabel.text = business.name
        ratingLabel.text = "Rating: \(business.rating)"
        totalReviewsLabel.text = "Total Reviews: \(business.totalReviews)"
    }
}
