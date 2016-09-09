//
//  SinglePurposeBrowseViewController.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/6/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit
import Cartography

class SinglePurposeBrowseViewController: UIViewController, SummarizedTableViewDelegate {
    private let user: User
    
    private lazy var dataSource: SummarizedTableViewDataSource<Account> = {
        SummarizedTableViewDataSource<Account>.browseAccountsDataSourceFromUser(self.user)
    }()
    
    private lazy var tableView: SummarizedTableView<Account, SinglePurposeBrowseViewController> = {
        let tableView = SummarizedTableView<Account, SinglePurposeBrowseViewController>(dataSource: self.dataSource)
        tableView.delegate = self
        return tableView
    }()

    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    typealias DelegateItem = Account
    func summarizedTableViewDidSelectItem(item: Account) {
        let accountDetailsViewController = MonolithicAccountDetailsViewController(account: item)
        navigationController!.pushViewController(accountDetailsViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        updateViewConstraints()
    }
    
    override func updateViewConstraints() {
        constrain(tableView) { $0.edges == $0.superview!.edges }
        super.updateViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
