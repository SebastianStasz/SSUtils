//
//  Decimal+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 16/04/2022.
//

import Foundation

public extension Decimal {

    /// Returns decimal value as a string.
    var asString: String {
        String(describing: self)
    }

    /// Resurns decimal value as integer.
    func toInt() -> Int {
        (self as NSDecimalNumber).intValue
    }

    /// Returns decimal value as a double.
    var asDouble: Double {
        Double(self.asString)!
//        (self as NSDecimalNumber).doubleValue
    }

    /// Returns true if value is an integer.
    var isInteger: Bool {
        rounded() == self
    }

    /// Returns whole part of decimal as a string.
    var whole: String {
        wholePart.asString
    }

    var wholePart: Decimal {
        rounded(sign == .minus ? .up : .down)
    }

    /// Returns fraction part of decimal as a string.
    var fraction: String {
        let fraction = self - wholePart
        return String((fraction * 100).asString.prefix(2))
    }

    /// Returns a random decimal value between the specified minimum and maximum value.
    static func randomBetween(_ minValue: Double, and maxValue: Double) -> Decimal {
        Decimal((Double(arc4random()) / 0xFFFFFFFF) * (maxValue - minValue) + minValue)
    }
}

// MARK: - Helpers

private extension Decimal {

    func rounded(_ roundingMode: NSDecimalNumber.RoundingMode = .plain) -> Decimal {
        var result = Decimal()
        var number = self
        NSDecimalRound(&result, &number, 0, roundingMode)
        return result
    }
}
