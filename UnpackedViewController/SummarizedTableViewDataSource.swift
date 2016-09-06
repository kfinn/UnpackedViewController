//
//  SummarizedTableViewDataSource.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import Foundation

struct SummarizedTableViewDataSource<Item> {
    let sections: [SummarizedTableViewSection<Item>]
    let summaryCellDataSource: SummaryCellDataSource
    
    static func browseAccountsDataSourceFromUser(user: User) -> SummarizedTableViewDataSource<Account> {
        let sections = user.brokerages.map(SummarizedTableViewSection<Account>.accountsSectionFromBrokerage)
        let summaryCellDataSource = SummaryCellDataSource.browseSummaryFromUser(user)
        return SummarizedTableViewDataSource<Account>(sections: sections, summaryCellDataSource: summaryCellDataSource)
    }
    
    static func rolloverAccountDataSourceFromUser(user: User) -> SummarizedTableViewDataSource<Account> {
        let sections = user.brokerages.map(SummarizedTableViewSection<Account>.accountsSectionFromBrokerage)
        let summaryCellDataSource = SummaryCellDataSource.rolloverSummaryFromUser(user)
        return SummarizedTableViewDataSource<Account>(sections: sections, summaryCellDataSource: summaryCellDataSource)
    }
    
    static func accountDetailsDataSourceFromAccount(account: Account) -> SummarizedTableViewDataSource<AccountDetail> {
        let sections = [SummarizedTableViewSection<AccountDetail>.accountDetailsSectionFromAccount(account)]
        let summaryCellDataSource = SummaryCellDataSource.fromAccount(account)
        return SummarizedTableViewDataSource<AccountDetail>(sections: sections, summaryCellDataSource: summaryCellDataSource)
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return sections[section].numberOfRows
    }
    
    func dataSourceForCellAtIndexPath(indexPath: NSIndexPath) ->DetailCellDataSource<Item> {
        return sections[indexPath.section].dataSourceForCellAtRow(indexPath.row)
    }
    
    func titleForSection(section: Int) -> String? {
        return self.sections[section].title
    }
}
