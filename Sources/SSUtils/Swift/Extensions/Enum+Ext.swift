//
//  Enum+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 25/12/2021.
//

import Foundation

/// Forces the definition of an unknown value
public protocol UnknownValueSupport where Self: Equatable {
    static var unknownCase: Self { get }
}

public extension RawRepresentable where RawValue == String, Self: UnknownValueSupport {

    /// Returns a new instance with the specified raw value or unknown case if initialization failed.
    /// - Warning: If raw value is invalid and not in production app, it will fail.
    /// - Parameter rawValue: The raw value to use for the new instance.
    /// - Returns: New instance or unknown case.
    static func getCase(for rawValue: String) -> Self {
        guard let enumCase = Self.init(rawValue: rawValue) else {
            assertionFailure("Failed to load enum case for rawValue: '\(rawValue)'. Enum: \(self)")
            return .unknownCase
        }
        return enumCase
    }
}
