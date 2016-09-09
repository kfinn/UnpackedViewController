//
//  UILabel+SummarizedTableView.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/7/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit

extension UILabel {
    public class func totalBalanceLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFontOfSize(25)
        return label
    }
}
