//
//  Extensions.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/7/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

extension String {
    mutating func getTwelveHourString() -> String? {
        insert(":", at: index(endIndex, offsetBy: -2))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        guard let date24 = dateFormatter.date(from: self) else { return nil }
        
        dateFormatter.dateFormat = "h:mm a"
        let date12 = dateFormatter.string(from: date24)
        
        return date12
    }
}

enum DayOfTheWeek: String, Hashable {
    case monday     = "Monday"
    case tuesday    = "Tuesday"
    case wednesday  = "Wednesday"
    case thursday   = "Thursday"
    case friday     = "Friday"
    case saturday   = "Saturday"
    case sunday     = "Sunday"
    case none       = ""
    
    init(day: Int) {
        if day == 0 {
            self = .monday
        } else if day == 1 {
            self = .tuesday
        } else if day == 2 {
            self = .wednesday
        } else if day == 3 {
            self = .thursday
        } else if day == 4 {
            self = .friday
        } else if day == 5 {
            self = .saturday
        } else if day == 6 {
            self = .sunday
        } else {
            self = .none
        }
    }
}

final class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: -1, height: -1)
        layer.shadowRadius = 3

        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension UIViewController {
    func showActivity(child: SpinnerViewController) {
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func hideActivity(child: SpinnerViewController) {
        if children.contains(child) {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }
}

extension UITableView {
    func reloadData(withAnimation animation: UITableView.RowAnimation) {
        reloadSections(IndexSet(integersIn: 0 ..< numberOfSections), with: animation)
    }
}
