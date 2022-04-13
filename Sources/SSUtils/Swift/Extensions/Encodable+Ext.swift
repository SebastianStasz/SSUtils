//
//  Encodable+Ext.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 25/03/2022.
//

import Foundation

public extension Encodable {

    /// Returns a JSON-encoded representation of the value you supply. Can throw an error.
    /// - Parameter encoder: An object that encodes instances of a data type as JSON objects.
    /// - Returns: The data value.
    func encoded(using encoder: JSONEncoder) throws -> Data {
        return try encoder.encode(self)
    }
}
