//
//  String+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 03/12/2021.
//

import Foundation

public extension String {
    var lowerCaseDiacriticInsensitive: String {
        self.lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
