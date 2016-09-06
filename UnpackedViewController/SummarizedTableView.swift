//
//  SummarizedTableView.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit
import Cartography

private let kSummaryCellReuseIdentifier = "kSummaryCellReuseIdentifier"
private let kDetailCellReuseIdentifier = "kDetailCellReuseIdentifier"

protocol SummarizedTableViewDelegate: class {
    associatedtype DelegateItem
    func summarizedTableViewDidSelectItem(item: DelegateItem)
    func summarizedTableViewDidSelectSummaryAction()
}

extension SummarizedTableViewDelegate {
    func summarizedTableViewDidSelectSummaryAction() {}
}

class SummarizedTableView<Item, Delegate: SummarizedTableViewDelegate where Item == Delegate.DelegateItem>: UIView, UITableViewDataSource, UITableViewDelegate, SummaryCellDelegate {
    
    let dataSource: SummarizedTableViewDataSource<Item>
    weak var delegate: Delegate?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.registerClass(SummaryCell.self, forCellReuseIdentifier:kSummaryCellReuseIdentifier)
        tableView.registerClass(DetailCell<Item>.self, forCellReuseIdentifier:kDetailCellReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 44
        return tableView
    }()
    
    init(dataSource: SummarizedTableViewDataSource<Item>) {
        self.dataSource = dataSource
        super.init(frame: CGRect())
        addSubview(tableView)
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        constrain(tableView) { $0.edges == $0.superview!.edges }
        super.updateConstraints();
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func dataSourceSection(section: Int) -> Int {
        return section - 1
    }
    
    func dataSourceIndexPath(indexPath: NSIndexPath) -> NSIndexPath {
        return NSIndexPath(forItem: indexPath.item, inSection: dataSourceSection(indexPath.section))
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : self.dataSource.numberOfRowsInSection(dataSourceSection(section))
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier(kSummaryCellReuseIdentifier, forIndexPath:indexPath) as! SummaryCell
            cell.dataSource = self.dataSource.summaryCellDataSource
            cell.delegate = self
            return cell
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(kDetailCellReuseIdentifier, forIndexPath:indexPath) as! DetailCell<Item>
        cell.dataSource = self.dataSource.dataSourceForCellAtIndexPath(dataSourceIndexPath(indexPath))
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.numberOfSections + 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return nil
        }
        return self.dataSource.titleForSection(dataSourceSection(section))
    }
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return indexPath.section != 0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = self.dataSource.dataSourceForCellAtIndexPath(dataSourceIndexPath(indexPath)).item
        self.delegate?.summarizedTableViewDidSelectItem(item)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func summaryCellDidPressButton(summaryCell: SummaryCell) {
        self.delegate?.summarizedTableViewDidSelectSummaryAction()
    }
}
