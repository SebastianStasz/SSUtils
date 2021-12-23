//
//  Optional+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Foundation

public extension Optional {

    var notNil: Bool {
        self != nil
    }

    var isNil: Bool {
        self == nil
    }
}
