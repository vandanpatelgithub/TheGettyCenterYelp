//
//  HoursComponentBuilder.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

class HoursComponentBuilder {
    static func buildHoursComponent(withHours hours: [BusinessHoursUIModel]) -> HoursComponentView? {
        guard let view = Bundle.main.loadNibNamed("HoursComponentView", owner: nil, options: nil)?.first as? HoursComponentView else {
            return nil
        }
        let presenter = HoursComponentPresenter(view: view, hours: hours)
        view.presenter = presenter
        return view
    }
}
