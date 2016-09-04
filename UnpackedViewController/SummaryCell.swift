//
//  SummaryCell.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit
import Cartography

class SummaryCell: UITableViewCell {
    
    var dataSource: SummaryCellDataSource? {
        didSet {
            if let dataSource = dataSource {
                totalBalanceValueLabel.text = "\(dataSource.totalBalance) total"
                subtitleLabel.text = dataSource.subtitle
            }
        }
    }
    
    let totalBalanceValueLabel = UILabel()
    let subtitleLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(totalBalanceValueLabel)
        contentView.addSubview(subtitleLabel)
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        constrain(totalBalanceValueLabel, subtitleLabel) {
            totalBalanceValueLabel, subtitleLabel in
            
            totalBalanceValueLabel.centerX == totalBalanceValueLabel.superview!.centerX
            totalBalanceValueLabel.width <= totalBalanceValueLabel.superview!.width
            totalBalanceValueLabel.top == totalBalanceValueLabel.superview!.top + 20
            
            subtitleLabel.centerX == totalBalanceValueLabel.centerX
            subtitleLabel.width <= subtitleLabel.superview!.width
            subtitleLabel.top == totalBalanceValueLabel.bottom + 10
            subtitleLabel.bottom == subtitleLabel.superview!.bottom - 20
        }
        
        super.updateConstraints()
    }
}
