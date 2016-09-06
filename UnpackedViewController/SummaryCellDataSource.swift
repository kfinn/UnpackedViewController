//
//  SummaryCellDataSource.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import Foundation
import Money

enum SummaryCellDetails {
    case Subtitle(text: String)
    case Button(title: String)
}

struct SummaryCellDataSource {
    let totalBalance: Money
    let details: SummaryCellDetails
    
    static func browseSummaryFromUser(user: User) -> SummaryCellDataSource {
        let pluralizedAccount = user.accountsCount == 1 ? "account" : "accounts"
        return SummaryCellDataSource(totalBalance: user.totalBalance, details: .Subtitle(text: "\(user.accountsCount) \(pluralizedAccount)"))
    }
    
    static func rolloverSummaryFromUser(user: User) -> SummaryCellDataSource {
        return SummaryCellDataSource(totalBalance: user.totalBalance, details: .Subtitle(text: "Select an account to roll over"))
    }
    
    static func fromAccount(account: Account) -> SummaryCellDataSource {
        return SummaryCellDataSource(totalBalance: account.balance, details: .Button(title: "Rollover"))
    }
}
