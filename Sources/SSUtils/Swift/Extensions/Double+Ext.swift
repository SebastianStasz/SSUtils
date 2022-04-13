//
//  Double+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 03/12/2021.
//

import Foundation

public extension Double {

    /// Returns double value as a string.
    var asString: String {
        String(self)
    }

    /// Returns double value as a string rounded to given decimal places.
    /// - Parameter decimalPlaces: Number of decimal places.
    func asString(roundToDecimalPlaces decimalPlaces: Int) -> String {
        String(format: "%.\(decimalPlaces.asString)f", self)
    }
}
