//
//  String+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 03/12/2021.
//

import Foundation

public extension String {

    /// Returns a lowercase version and of the string, and removing from both ends whitespaces and new lines.
    var lowerCaseDiacriticInsensitive: String {
        self.lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// Returns a new string in which all occurrences of a comma are replaced with a dot.
    var replacingCommaWithDot: String {
        replacingOccurrences(of: ",", with: ".")
    }


    /// Returns a double-precision, floating-point value type from a string, if possible.
    var asDouble: Double? {
        Double(self)
    }
}
