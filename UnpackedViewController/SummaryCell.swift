//
//  SummaryCell.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import UIKit
import Cartography

protocol SummaryCellDelegate: class {
    func summaryCellDidPressButton(summaryCell: SummaryCell)
}

class SummaryCell: UITableViewCell {
    
    weak var delegate: SummaryCellDelegate?
    
    var dataSource: SummaryCellDataSource? {
        didSet {
            if let dataSource = dataSource {
                totalBalanceValueLabel.text = "\(dataSource.totalBalance) total"
                
                switch dataSource.details {
                case let .Subtitle(text):
                    button.hidden = true
                    subtitleLabel.hidden = false
                    subtitleLabel.text = text
                case let .Button(title):
                    button.hidden = false
                    button.setTitle(title, forState: .Normal)
                    subtitleLabel.hidden = true
                }
            }
        }
    }
    
    lazy var totalBalanceValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.whiteColor()
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.whiteColor()
        return label;
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonPressed), forControlEvents: .TouchUpInside)
        button.setTitleColor(UIColor.cyanColor(), forState: .Normal)
        return button
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.darkGrayColor()
        contentView.addSubview(totalBalanceValueLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(button)
        setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        constrain(totalBalanceValueLabel, subtitleLabel, button) {
            totalBalanceValueLabel, subtitleLabel, button in
            
            totalBalanceValueLabel.centerX == totalBalanceValueLabel.superview!.centerX
            totalBalanceValueLabel.width <= totalBalanceValueLabel.superview!.width
            totalBalanceValueLabel.top == totalBalanceValueLabel.superview!.top + 20
            
            subtitleLabel.centerX == totalBalanceValueLabel.centerX
            subtitleLabel.width <= subtitleLabel.superview!.width
            subtitleLabel.top == totalBalanceValueLabel.bottom + 10
            subtitleLabel.bottom == subtitleLabel.superview!.bottom - 20
            
            button.edges == subtitleLabel.edges
        }
        
        super.updateConstraints()
    }
    
    func buttonPressed() {
        delegate?.summaryCellDidPressButton(self)
    }
}
