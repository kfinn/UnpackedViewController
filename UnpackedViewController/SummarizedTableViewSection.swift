//
//  SummarizedTableViewSection.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import Foundation

struct SummarizedTableViewSection<Item> {
    let rows: [DetailCellDataSource<Item>]
    let title: String?
    
    static func accountsSectionFromBrokerage(brokerage: Brokerage) -> SummarizedTableViewSection<Account> {
        let rows = brokerage.accounts.map(DetailCellDataSource<Account>.fromAccount)
        return SummarizedTableViewSection<Account>(rows: rows, title: brokerage.name)
    }
    
    static func accountDetailsSectionFromAccount(account: Account) -> SummarizedTableViewSection<AccountDetail> {
        let rows = AccountDetail.allDetailsForAccount(account).map(DetailCellDataSource<AccountDetail>.fromAccountDetail)
        return SummarizedTableViewSection<AccountDetail>(rows: rows, title: nil)
    }
    
    var numberOfRows: Int {
        return rows.count
    }

    func dataSourceForCellAtRow(row: Int) -> DetailCellDataSource<Item> {
        return rows[row]
    }
}
