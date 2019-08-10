//
//  HoursComponentPresenter.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import Foundation

protocol HoursComponentPresentable {
    func loadData()
}

class HoursComponentPresenter {
    
    let view: HoursComponentViewable
    let hours: [BusinessHoursUIModel]
    
    init(view: HoursComponentViewable, hours: [BusinessHoursUIModel]) {
        self.view = view
        self.hours = hours
    }
}

extension HoursComponentPresenter: HoursComponentPresentable {
    func loadData() {
        guard let hours = self.hours.first?.openingHours else { return }
        view.display(hours: Set(hours))
    }
}
