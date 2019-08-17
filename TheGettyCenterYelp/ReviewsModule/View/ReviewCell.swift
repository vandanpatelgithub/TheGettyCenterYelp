//
//  ReviewCell.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/16/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.dropShadow()
        separatorInset = UIEdgeInsets(top: 0, left: frame.width, bottom: 0, right: 0)
    }
    
    func populateCell(withReview review: BusinessReview) {
        nameLabel.text = review.user.name
        ratingLabel.text = "Rating: \(review.rating)"
        reviewLabel.text = review.text
    }
}
