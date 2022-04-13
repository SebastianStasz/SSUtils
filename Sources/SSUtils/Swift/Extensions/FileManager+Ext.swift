//
//  FileManager+Ext.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 10/04/2022.
//

import Foundation

public extension FileManager {

    /// Creates a temporary file for the current user with specified name and extension.
    /// - Parameters:
    ///   - fileName: Name of the file.
    ///   - fileExtension: Extension of the file.
    /// - Returns: URL that identifies the location of the file.
    static func temporaryURL(fileName: String, fileExtension: FileExtension) -> URL {
        temporaryURL(fileName: fileName, fileExtension: fileExtension.rawValue)
    }

    /// Creates a temporary file for the current user with specified name and extension.
    /// - Parameters:
    ///   - fileName: Name of the file.
    ///   - fileExtension: Extension of the file.
    /// - Returns: URL that identifies the location of the file.
    static func temporaryURL(fileName: String, fileExtension: String) -> URL {
        FileManager.default.temporaryDirectory
            .appendingPathComponent(fileName)
            .appendingPathExtension(fileExtension)
    }
}
