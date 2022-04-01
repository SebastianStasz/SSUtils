//
//  URLRequest+Ext.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 25/03/2022.
//

import Foundation

public extension URLRequest {
    mutating func addHTTPHeaders(_ headers: [String: String]) {
        for (key, value) in headers {
            addValue(value, forHTTPHeaderField: key)
        }
    }
}
