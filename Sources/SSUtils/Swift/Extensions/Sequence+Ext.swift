//
//  Sequence+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 12/04/2022.
//

import Foundation

public extension Sequence {

    /// Returns an array containing the results of asynchronous and throwing mapping the given closure over the sequence’s elements.
    /// - Parameter transform: A mapping closure. `transform` accepts an element of this sequence as its parameter and returns a transformed value of the same or of a different type.
    /// - Returns: An array containing the transformed elements of this sequence.
    func asyncMap<T>(_ transform: (Element) async throws -> T) async rethrows -> [T] {
        var values: [T] = []
        for element in self {
            try await values.append(transform(element))
        }
        return values
    }
}
