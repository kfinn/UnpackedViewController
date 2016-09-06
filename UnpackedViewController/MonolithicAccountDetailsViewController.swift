//
//  MonolithicAccountDetailsViewController.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/5/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit
import SwiftDate

private let kSummaryCellReuseIdentifier = "kSummaryCellReuseIdentifier"
private let kDetailCellReuseIdentifier = "kDetailCellReuseIdentifier"

private let kSummarySection = 0
private let kDetailsSection = kSummarySection + 1
private let kNumberOfSections = kDetailsSection + 1

private let kAccountIDRow = 0
private let kLastUpdatedRow = kAccountIDRow + 1
private let kNumberOfDetailRows = kLastUpdatedRow + 1

private let kUpdatedAtFormatterStyle = FormatterStyle(style: .Full, max: 1)

class MonolithicAccountDetailsViewController: UITableViewController {
    let account: Account
    
    init(account: Account) {
        self.account = account
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(SummaryCell.self, forCellReuseIdentifier:kSummaryCellReuseIdentifier)
        tableView.registerClass(DetailCell<Any>.self, forCellReuseIdentifier:kDetailCellReuseIdentifier)
        tableView.estimatedRowHeight = 44
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return kNumberOfSections
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case kSummarySection:
            return 1
        case kDetailsSection:
            return kNumberOfDetailRows
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case kSummarySection:
            let cell = tableView.dequeueReusableCellWithIdentifier(kSummaryCellReuseIdentifier, forIndexPath:indexPath) as! SummaryCell
            cell.totalBalanceValueLabel.text = "\(account.balance)"
            cell.button.setTitle("Rollover", forState: .Normal)
            cell.button.addTarget(self, action: #selector(rolloverButtonPressed), forControlEvents: .TouchUpInside)
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier(kDetailCellReuseIdentifier, forIndexPath:indexPath) as! DetailCell<Any>
            switch indexPath.row {
            case kAccountIDRow:
                cell.titleLabel.text = "Account ID"
                cell.valueLabel.text = "\(account.id)"
            default:
                cell.titleLabel.text = "Last Updated"
                cell.valueLabel.text = "\(account.updatedAt.toNaturalString(NSDate(), style: kUpdatedAtFormatterStyle)!) ago"
            }
            return cell
        }
    }
    
    func rolloverButtonPressed() {
        let alert = UIAlertController(title: "Rollover Initiated", message: nil, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
}
