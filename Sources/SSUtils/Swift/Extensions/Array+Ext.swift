//
//  Array+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 06/11/2021.
//

import Foundation

public extension Array {

    /// A Boolean value indicating whether the collection is not empty.
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}

public extension Set {
    
    /// A Boolean value indicating whether the set is not empty.
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}
