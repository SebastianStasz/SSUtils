//
//  ActivityAction.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 05/04/2022.
//

import UIKit

public struct ActivityAction {
    let items: [Any]
    let activities: [UIActivity]
    let excludedTypes: [UIActivity.ActivityType]

    public init(
        items: Any...,
        activities: [UIActivity] = [],
        excludedTypes: [UIActivity.ActivityType] = []
    ) {
        self.items = items
        self.activities = []
        self.excludedTypes = []
    }
}
