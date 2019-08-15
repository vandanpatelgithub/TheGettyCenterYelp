//
//  NameComponentBuilder.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/14/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

class NameComponentBuilder {
    static func buildNameComponent(withBusiness business: BusinessUIModel) -> NameComponentView? {
        guard let view = Bundle.main.loadNibNamed("NameComponentView", owner: nil, options: nil)?.first as? NameComponentView else {
            return nil
        }
        let presenter = NameComponentPresenter(view: view, business: business)
        view.presenter = presenter
        return view
    }
}
