//
//  SummaryCellDataSource.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import Foundation
import Money

struct SummaryCellDataSource {
    let totalBalance: Money
    let subtitle: String
    
    static func fromUser(user: User) -> SummaryCellDataSource {
        let pluralizedAccount = user.accountsCount == 1 ? "account" : "accounts"
        return SummaryCellDataSource(totalBalance: user.totalBalance, subtitle: "\(user.accountsCount) \(pluralizedAccount)")
    }
}
