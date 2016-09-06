//
//  LoginViewController.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit
import PromiseKit
import Cartography

class LoginViewController: UIViewController {
    lazy var browseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Browse Accounts", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.addTarget(self, action: #selector(LoginViewController.browsePressed), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select an account", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.addTarget(self, action: #selector(LoginViewController.selectPressed), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        view.backgroundColor = UIColor(white:0, alpha:0.8)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(browseButton)
        view.addSubview(selectButton)
        view.addSubview(activityIndicatorView)
        updateViewConstraints()
    }
    
    override func updateViewConstraints() {
        constrain(browseButton, selectButton, activityIndicatorView) {
            browseButton, selectButton, activityIndicatorView in
            browseButton.top == browseButton.superview!.centerY - 100
            browseButton.left == browseButton.superview!.left
            browseButton.right == browseButton.superview!.right
            
            selectButton.top == browseButton.bottom + 20
            selectButton.left == selectButton.superview!.left
            selectButton.right == selectButton.superview!.right
            
            activityIndicatorView.edges == activityIndicatorView.superview!.edges
        }
        
        super.updateViewConstraints()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicatorView.startAnimating()
        User.update().then { () -> Void in
            UIView.animate(duration: 2) {
                self.activityIndicatorView.hidden = true
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
    
    func browsePressed() {
        let flow = BrowseAccountsFlow(user: User.currentUser)
        self.presentViewController(flow.viewController, animated: true, completion: nil)
    }
    
    func selectPressed() {
        let flow = SelectAccountFlow(user: User.currentUser)
        self.presentViewController(flow.viewController, animated: true, completion:nil)
    }
}
