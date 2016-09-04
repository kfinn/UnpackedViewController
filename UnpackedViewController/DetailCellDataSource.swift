//
//  DetailCellDataSource.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import Foundation

struct DetailCellDataSource<Item> {
    let title: String
    let value: String
    let item: Item
    
    static func fromAccount(account: Account) -> DetailCellDataSource<Account> {
        return DetailCellDataSource<Account>(title: account.name, value: "\(account.balance)", item: account)
    }
}
