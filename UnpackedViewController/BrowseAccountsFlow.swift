//
//  BrowseAccountsFlow.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/4/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit

struct BrowseAccountsFlow {
    let user: User
    
    var viewController: UIViewController {
        let viewController = SummarizedTableViewController<Account>.browseAccountsViewControllerFromUser(user)
        
        viewController.handleItemSelected = {
            viewController, account in
            let nextViewController = self.accountDetailsViewControllerForAccount(account)
            viewController.navigationController!.pushViewController(nextViewController, animated: true)
        }
        
        viewController.handleCancel = { $0.dismissViewControllerAnimated(true, completion: nil) }
        
        return UINavigationController(rootViewController: viewController)
    }
    
    private func accountDetailsViewControllerForAccount(account: Account) -> UIViewController {
        let viewController = SummarizedTableViewController<AccountDetail>.accountDetailsViewControllerFromAccount(account)
        
        viewController.handleSummaryAction = {
            viewController in
            let nextViewController = self.rolloverViewControllerForAccount(account)
            viewController.presentViewController(nextViewController, animated: true, completion: nil)
        }
        
        return viewController
    }
    
    private func rolloverViewControllerForAccount(account: Account) -> UIViewController {
        let alert = UIAlertController(title: "Rollover Initiated", message: nil, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        return alert
    }
}
