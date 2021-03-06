//
//  NSManagedObject+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 14/11/2021.
//

import CoreData

public extension NSManagedObject {

    /// Returns a description of search criteria used to retrieve data from a persistent store.
    /// - Parameters:
    ///   - sortDescriptors: The sort descriptors of the fetch request.
    ///   - predicate: The predicate of the fetch request.
    /// - Returns: A description of search criteria as `NSFetchRequest`.
    static func nsFetchRequest<T: NSManagedObject>(sortDescriptors: [NSSortDescriptor] = [], predicate: NSPredicate? = nil) -> NSFetchRequest<T> {
        let name = String(describing: type(of: T.self)).replacingOccurrences(of: ".Type", with: "")
        let request = NSFetchRequest<T>(entityName: name)
        request.sortDescriptors = sortDescriptors
        request.predicate = predicate
        return request
    }

    /// Returns the managed object context with which the managed object is registered, if found.
    func getContext() -> NSManagedObjectContext? {
        guard let context = self.managedObjectContext else {
            assertionFailure("Context coulnd not be found in: \(self.description)")
            return nil
        }
        return context
    }
}
