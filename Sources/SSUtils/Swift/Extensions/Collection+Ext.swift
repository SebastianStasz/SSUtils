//
//  Collection+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 06/11/2021.
//

import Foundation

public extension Collection {
    
    /// A Boolean value indicating whether the collection is not empty.
    var isNotEmpty: Bool {
        !isEmpty
    }
}

public extension Collection where Element: Equatable {

    func notContains(_ element: Element) -> Bool {
        !self.contains(element)
    }

    func notContains(where predicate: (Self.Element) throws -> Bool) rethrows -> Bool {
        try !self.contains(where: predicate)
    }
}
