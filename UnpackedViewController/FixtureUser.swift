//
//  FixtureUser.swift
//  UnpackedViewController
//
//  Created by Kevin Finn on 9/3/16.
//  Copyright © 2016 Betterment. All rights reserved.
//

import Foundation
import SwiftDate

let FixtureUser = [
    "id": 1,
    "brokerages": [[
        "id": 1,
        "name": "Vanguard",
        "accounts": [[
            "id": 1,
            "name": "Traditional 401k",
            "updatedAt": 1.days.ago,
            "balanceCents": 25836113
            ],
            [
                "id": 2,
                "name": "Roth 401k",
                "updatedAt": 2.days.ago,
                "balanceCents": 458640
            ]]
        ],
        [
            "id": 2,
            "name": "Fidelity",
            "accounts": [[
                "id": 3,
                "name": "Roth IRA",
                "updatedAt": 3.days.ago,
                "balanceCents": 756345
                ]]
        ]
    ]
]
