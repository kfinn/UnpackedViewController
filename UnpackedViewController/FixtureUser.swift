//
//  FixtureUser.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import Foundation


private let kOneDayAgo: NSTimeInterval = -60*60*24

let FixtureUser = [
    "id": 1,
    "brokerages": [[
        "id": 1,
        "name": "Vanguard",
        "accounts": [[
            "id": 1,
            "name": "Traditional 401k",
            "updatedAt": NSDate(timeIntervalSinceNow: kOneDayAgo),
            "balanceCents": 25836113
            ],
            [
                "id": 2,
                "name": "Roth 401k",
                "updatedAt": NSDate(timeIntervalSinceNow: 2 * kOneDayAgo),
                "balanceCents": 458640
            ]]
        ],
        [
            "id": 2,
            "name": "Fidelity",
            "accounts": [[
                "id": 3,
                "name": "Roth IRA",
                "updatedAt": NSDate(timeIntervalSinceNow: 3 * kOneDayAgo),
                "balanceCents": 756345
                ]]
        ]
    ]
]
