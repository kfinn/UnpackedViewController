//
//  User.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import Foundation
import RealmSwift
import PromiseKit
import Money

class User: Object {
    dynamic var id: Int64 = 0
    let brokerages = List<Brokerage>()
    
    var totalBalance: Money {
        return brokerages.reduce(0) { balance, b in balance + b.totalBalance }
    }
    
    var accountsCount: Int {
        return brokerages.reduce(0) { count, b in count + b.accountsCount }
    }
    
    override class func primaryKey() -> String? { return "id" }
    
    class func update() -> Promise<Void> {
        return Promise {
            fulfill, reject in
            do {
                let realm = try Realm()
                try realm.write {
                    let user = User(value: FixtureUser)
                    realm.add(user, update: true)
                }
            } catch let error {
                reject(error)
            }
            fulfill()
        }
    }
    
    class var currentUser: User {
        return try! Realm().objects(User.self).first!
    }
}
