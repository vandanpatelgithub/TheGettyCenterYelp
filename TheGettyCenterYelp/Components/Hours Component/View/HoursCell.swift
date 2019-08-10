//
//  HoursCell.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

class HoursCell: UITableViewCell {
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populateCell(day: DayOfTheWeek, hours: OpeningHoursUIModel?) {
        dayLabel.text = day.rawValue
        if let hours = hours {
            hoursLabel.text = "\(hours.start) - \(hours.end)"
        } else {
            hoursLabel.text = "Closed"
        }
    }
}
