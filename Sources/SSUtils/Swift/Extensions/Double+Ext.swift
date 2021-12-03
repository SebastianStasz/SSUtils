//
//  Double+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 03/12/2021.
//

import Foundation

public extension Double {
    var asString: String {
        String(self)
    }
    
    func asString(roundToDecimalPlaces decimalPlaces: Int) -> String {
        String(format: "%.\(decimalPlaces.asString)f", self)
    }
}
