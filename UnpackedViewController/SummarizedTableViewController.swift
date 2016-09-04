//
//  SummarizedTableViewController.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit
import Cartography

class SummarizedTableViewController<Item>: UIViewController {
    let dataSource: SummarizedTableViewDataSource<Item>
    
    lazy var tableView: SummarizedTableView<Item> = {
        return SummarizedTableView<Item>(dataSource: self.dataSource)
    }()
    
    init(dataSource: SummarizedTableViewDataSource<Item>) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
        self.title = "Accounts"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}
