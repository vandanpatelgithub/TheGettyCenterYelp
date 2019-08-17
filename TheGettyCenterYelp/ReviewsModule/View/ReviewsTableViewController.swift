//
//  ReviewsTableViewController.swift
//  TheGettyCenterYelp
//
//  Created by Vandan Patel on 8/15/19.
//  Copyright © 2019 Vandan Patel. All rights reserved.
//

import UIKit

protocol ReviewsTableViewable: class {
    func display(reviews: [BusinessReview])
}

class ReviewsTableViewController: UITableViewController, Storyboarded {
    
    let reuseIdentifier = "reviewsCell"
    var presenter: ReviewsTableViewPresenter!
    var businessReviews = [BusinessReview]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        title = "Reviews"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.businessReviews.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ReviewCell else {
            return UITableViewCell()
        }
        cell.populateCell(withReview: self.businessReviews[indexPath.row])
        return cell
    }
}

extension ReviewsTableViewController: ReviewsTableViewable {
    func display(reviews: [BusinessReview]) {
        self.businessReviews = reviews
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
}
