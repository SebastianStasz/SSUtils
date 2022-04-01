//
//  Encodable+Ext.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 25/03/2022.
//

import Foundation

public extension Encodable {
    func encoded(using encoder: JSONEncoder) throws -> Data {
        return try encoder.encode(self)
    }
}
