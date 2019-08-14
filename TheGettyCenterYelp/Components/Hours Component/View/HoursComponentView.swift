//
//  HoursComponentView.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/10/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

enum HoursComponentViewConstants: String {
    case cellID = "hoursCell"
}

protocol HoursComponentViewable: class {
    func display(hours: Set<OpeningHoursUIModel>)
}

class HoursComponentView: UIView {
    
    @IBOutlet weak var tableView: ContentSizedTableView!
    var presenter: HoursComponentPresentable!
    var hours = Set<OpeningHoursUIModel>()
    let days: [DayOfTheWeek] = [.monday, .tuesday, .wednesday, .thursday, .friday, .saturday, .sunday]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.register(UINib(nibName: "HoursCell", bundle: nil),
                           forCellReuseIdentifier: HoursComponentViewConstants.cellID.rawValue)
        tableView.tableFooterView = UIView()
    }
    
    private func populateCell(_ indexPath: IndexPath, _ cell: HoursCell) {
        let day = days[indexPath.row]
        if day == days.last { cell.separatorInset = UIEdgeInsets.zero }
        if let hours = self.hours.first(where: { $0.day == day }) { cell.populateCell(day: day, hours: hours) }
        else { cell.populateCell(day: day, hours: nil) }
    }

}

extension HoursComponentView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HoursComponentViewConstants.cellID.rawValue,
                                                       for: indexPath) as? HoursCell else {
            return UITableViewCell()
        }
        populateCell(indexPath, cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hours"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0
    }
    
}

extension HoursComponentView: HoursComponentViewable {
    func display(hours: Set<OpeningHoursUIModel>) {
        self.hours = hours
        self.tableView.reloadData()
    }
}
