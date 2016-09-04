//
//  Brokerage.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import Foundation
import RealmSwift
import Money

class Brokerage: Object {
    dynamic var id: Int64 = 0
    dynamic var name: String = ""
    let accounts = List<Account>()
    
    var totalBalance: Money {
        return accounts.reduce(0) { balance, a in balance + a.balance }
    }
    
    var accountsCount: Int {
        return accounts.count
    }
    
    override class func primaryKey() -> String? { return "id" }
}
