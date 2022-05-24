//
//  Date+Ext.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 03/04/2022.
//

import Foundation

public extension Date {

    /// Returns month and year components of a date, using the calendar current time zone.
    var monthAndYear: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: self)
        return Calendar.current.date(from: components)!
    }

    // Returns year, using the calendar current time zone.
    var year: Int {
        Calendar.current.component(.year, from: self)
    }

    // Returns month, using the calendar current time zone.
    var month: Int {
        Calendar.current.component(.month, from: self)
    }
}
