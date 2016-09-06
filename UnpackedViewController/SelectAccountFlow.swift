//
//  SelectAccountFlow.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/4/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit

struct SelectAccountFlow {
    let user: User
    
    var viewController: UIViewController {
        let viewController = SummarizedTableViewController<Account>.selectRolloverAccountViewControllerFromUser(user)
        
        viewController.handleItemSelected = {
            viewController, account in
            let nextViewController = self.rolloverViewControllerForAccount(account)
            viewController.presentViewController(nextViewController, animated: true, completion: nil)
        }
        
        viewController.handleCancel = { $0.dismissViewControllerAnimated(true, completion: nil) }
        
        return UINavigationController(rootViewController: viewController)
    }
    
    private func rolloverViewControllerForAccount(account: Account) -> UIViewController {
        let alert = UIAlertController(title: "Rollover Initiated", message: nil, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        return alert
    }
}