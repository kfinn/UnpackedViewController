//
//  AccountDetail.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/4/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import Foundation
import SwiftDate

private let kUpdatedAtFormatterStyle = FormatterStyle(style: .Full, max: 1)

enum AccountDetail {
    case Id(account: Account), UpdatedAt(account: Account)
    
    static func allDetailsForAccount(account: Account) -> [AccountDetail] {
        return [.Id(account: account), .UpdatedAt(account: account)]
    }
    
    var title: String {
        switch self {
        case .Id:
            return "Account ID"
        case .UpdatedAt:
            return "Last Updated"
        }
    }
    
    var value: String {
        switch self {
        case let .Id(account):
            return "\(account.id)"
        case let .UpdatedAt(account):
            return "\(account.updatedAt.toNaturalString(NSDate(), style: kUpdatedAtFormatterStyle)!) ago"
        }
    }
}
