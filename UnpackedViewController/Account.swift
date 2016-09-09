//
//  Account.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import Foundation
import RealmSwift
import Money
import SwiftDate

private let kUpdatedAtFormatterStyle = FormatterStyle(style: .Full, max: 1)

class Account: Object {
    dynamic var id: Int64 = 0
    dynamic var name: String = ""
    dynamic var updatedAt: NSDate = NSDate(timeIntervalSinceReferenceDate: 0)
    dynamic var balanceCents: Int = 0
    
    var balance: Money {
        return Money(minorUnits: balanceCents)
    }
    
    var displayUpdatedAt: String {
        return "\(updatedAt.toNaturalString(NSDate(), style: kUpdatedAtFormatterStyle)!) ago"
    }
    
    override class func primaryKey() -> String? { return "id" }
}
