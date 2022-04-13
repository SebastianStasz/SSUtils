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

    /// Returns a Boolean value indicating whether the sequence not contains the given element.
    func notContains(_ element: Element) -> Bool {
        !self.contains(element)
    }

    /// Returns a Boolean value indicating whether the sequence not contains an element that satisfies the given predicate.
    func notContains(where predicate: (Self.Element) throws -> Bool) rethrows -> Bool {
        try !self.contains(where: predicate)
    }

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
