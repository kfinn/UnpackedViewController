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
    
    static func accountsDataSourceFromUser(user: User) -> SummarizedTableViewDataSource<Account> {
        let sections = user.brokerages.map(SummarizedTableViewSection<Account>.accountsSectionFromBrokerage)
        let summaryCellDataSource = SummaryCellDataSource.fromUser(user)
        return SummarizedTableViewDataSource<Account>(sections: sections, summaryCellDataSource: summaryCellDataSource)
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
