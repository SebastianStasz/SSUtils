//
//  Regex.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 24/04/2022.
//

import Foundation

public enum Regex: String {
    case containsNumber = ".*?[0-9]"
    case containsUpperAndLowerCharacter = "(?=.*?[A-Z])(?=.*?[a-z])"
    case containsSpecialCharacter = #".*?[*.!@$%^&(){}.,\[\]:;<>?\\/~_+-=|\\]"#
}
