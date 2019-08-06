//
//  Storyboarded.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/5/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}

