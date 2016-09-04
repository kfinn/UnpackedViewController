//
//  LoginViewController.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit
import PromiseKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        User.update().then { () -> Void in
            let dataSource = SummarizedTableViewDataSource<Any>.accountsDataSourceFromUser(User.currentUser)
            let viewController = SummarizedTableViewController(dataSource: dataSource)
            let navigationController = UINavigationController(rootViewController: viewController)
            self.presentViewController(navigationController, animated: true, completion: nil)
        }
    }
}
