//
//  MonolithicAccountDetailsViewController.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/5/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit

private let kSummaryCellReuseIdentifier = "kSummaryCellReuseIdentifier"
private let kDetailCellReuseIdentifier = "kDetailCellReuseIdentifier"

class MonolithicAccountDetailsViewController: UITableViewController {
    let account: Account
    
    init(account: Account) {
        self.account = account
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(SummaryCell.self,
                                forCellReuseIdentifier:kSummaryCellReuseIdentifier)
        tableView.registerClass(DetailCell<Any>.self,
                                forCellReuseIdentifier:kDetailCellReuseIdentifier)
        tableView.estimatedRowHeight = 44
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView)
        -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView,
                            numberOfRowsInSection section: Int)
        -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 2
        }
    }
    
    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier(
                kSummaryCellReuseIdentifier,
                forIndexPath:indexPath) as! SummaryCell
            cell.totalBalanceLabel.text = "\(account.balance)"
            cell.button.setTitle("Rollover", forState: .Normal)
            cell.button.addTarget(self,
                                  action: #selector(rolloverButtonPressed),
                                  forControlEvents: .TouchUpInside)
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier(
                kDetailCellReuseIdentifier,
                forIndexPath:indexPath) as! DetailCell<Any>
            switch indexPath.row {
            case 0:
                cell.titleLabel.text = "Account ID"
                cell.valueLabel.text = "\(account.id)"
            default:
                cell.titleLabel.text = "Last Updated"
                cell.valueLabel.text = account.displayUpdatedAt
            }
            return cell
        }
    }
    
    func rolloverButtonPressed() {
        let alert = UIAlertController(title: "Rollover Initiated", message: nil, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
