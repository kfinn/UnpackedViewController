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

class Account: Object {
    dynamic var id: Int64 = 0
    dynamic var name: String = ""
    dynamic var updatedAt: NSDate = NSDate(timeIntervalSinceReferenceDate: 0)
    dynamic var balanceCents: Int = 0
    
    var balance: Money {
        return Money(minorUnits: balanceCents)
    }
    
    override class func primaryKey() -> String? { return "id" }
}
