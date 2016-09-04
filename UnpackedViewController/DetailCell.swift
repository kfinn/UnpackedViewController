//
//  DetailCell.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit
import Cartography

class DetailCell<Item>: UITableViewCell {
    var dataSource: DetailCellDataSource<Item>? {
        didSet {
            if let dataSource = dataSource {
                titleLabel.text = dataSource.title
                valueLabel.text = dataSource.value
            }

            setNeedsUpdateConstraints()
        }
    }
    
    let titleLabel = UILabel()
    let valueLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        constrain(titleLabel, valueLabel) {
            titleLabel, valueLabel in
            
            titleLabel.top == titleLabel.superview!.top + 15
            titleLabel.left == titleLabel.superview!.left + 15
            titleLabel.bottom == titleLabel.superview!.bottom - 15
            
            valueLabel.top == valueLabel.superview!.top + 15
            valueLabel.left == titleLabel.right
            valueLabel.right == valueLabel.superview!.right - 15
            valueLabel.bottom == valueLabel.superview!.bottom - 15
        }
        super.updateConstraints()
    }
}
