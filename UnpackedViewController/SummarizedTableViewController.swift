//
//  SummarizedTableViewController.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit
import Cartography

class SummarizedTableViewController<Item>: UIViewController, SummarizedTableViewDelegate {
    private let dataSource: SummarizedTableViewDataSource<Item>
    
    var handleItemSelected: ((SummarizedTableViewController<Item>, Item) -> ())?
    var handleSummaryAction: ((SummarizedTableViewController<Item>) -> ())?

    var handleCancel: ((SummarizedTableViewController<Item>) -> ())? {
        didSet {
            if handleCancel != nil {
                self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(SummarizedTableViewController.cancelPressed))
            } else {
                self.navigationItem.leftBarButtonItem = nil
            }
        }
    }
    
    lazy var tableView: SummarizedTableView<Item, SummarizedTableViewController<Item>> = {
        let tableView = SummarizedTableView<Item, SummarizedTableViewController<Item>>(dataSource: self.dataSource)
        tableView.delegate = self
        return tableView
    }()
    
    init(dataSource: SummarizedTableViewDataSource<Item>) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    class func browseAccountsViewControllerFromUser(user: User) -> SummarizedTableViewController<Account> {
        let dataSource = SummarizedTableViewDataSource<Account>.browseAccountsDataSourceFromUser(user)
        let viewController = SummarizedTableViewController<Account>(dataSource: dataSource)
        viewController.title = "Accounts"
        return viewController
    }
    
    class func selectRolloverAccountViewControllerFromUser(user: User) -> SummarizedTableViewController<Account> {
        let dataSource = SummarizedTableViewDataSource<Account>.rolloverAccountDataSourceFromUser(user)
        let viewController = SummarizedTableViewController<Account>(dataSource: dataSource)
        viewController.title = "Select Account"
        return viewController
    }
    
    class func accountDetailsViewControllerFromAccount(account: Account) -> SummarizedTableViewController<AccountDetail> {
        let dataSource = SummarizedTableViewDataSource<AccountDetail>.accountDetailsDataSourceFromAccount(account)
        let viewController =  SummarizedTableViewController<AccountDetail>(dataSource: dataSource)
        viewController.title = account.name
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        updateViewConstraints()
    }
    
    override func updateViewConstraints() {
        constrain(tableView) { v in v.edges == v.superview!.edges }
        super.updateViewConstraints()
    }
    
    typealias DelegateItem = Item
    func summarizedTableViewDidSelectItem(item: DelegateItem) {
        handleItemSelected?(self, item)
    }
    
    func summarizedTableViewDidSelectSummaryAction() {
        handleSummaryAction?(self)
    }
    
    func cancelPressed() {
        handleCancel?(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
