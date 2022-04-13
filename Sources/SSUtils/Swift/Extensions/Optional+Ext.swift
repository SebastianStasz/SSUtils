//
//  Optional+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 23/12/2021.
//

import Foundation

public extension Optional {

    /// Returns a Boolean value indicating whether the object is not nill.
    var notNil: Bool {
        self != nil
    }

    /// Returns a Boolean value indicating whether the object is nill.
    var isNil: Bool {
        self == nil
    }
}
