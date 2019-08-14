//
//  ImageComponentView.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/12/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

protocol ImageComponentViewable: class {
    func didLoadImageData(data: Data?)
}

class ImageComponentView: UIView {
    @IBOutlet weak var stackView: UIStackView!
    var presenter: ImageComponentPresentable!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension ImageComponentView: ImageComponentViewable {
    func didLoadImageData(data: Data?) {
    }
}
