//
//  URLRequest+Ext.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 25/03/2022.
//

import Foundation

public extension URLRequest {

    /// Adds HTTP headers to the URLRequest.
    /// - Parameter headers: Dictionary of keys and values. Key represents http header field. Value represents value for that field.
    mutating func addHTTPHeaders(_ headers: [String: String]) {
        for (key, value) in headers {
            addValue(value, forHTTPHeaderField: key)
        }
    }
}
