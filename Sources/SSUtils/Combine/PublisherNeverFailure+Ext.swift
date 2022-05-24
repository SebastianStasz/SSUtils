//
//  PublisherNeverFailure+Ext.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 13/04/2022.
//

import Combine
import Foundation

public extension Publisher where Failure == Never {

    /// Assignes elements recived from a publisher, to variable indicated by the key path on the specified object.
    /// - Parameters:
    ///   - keyPath: A key path that supports reading from and writing to the resulting value with reference semantics.
    ///   - object: Any object that conforms to `CombineHelper` protocol.
    func weakAssign<T: CombineHelper>(to keyPath: ReferenceWritableKeyPath<T, Output>, on object: T) {
        sink { [weak object] value in object?[keyPath: keyPath] = value }.store(in: &object.cancellables)
    }

    /// Wraps this publisher with a type eraser.
    var asDriver: Driver<Output> {
        eraseToAnyPublisher()
    }

    func asVoid() -> Driver<Void> {
        map { _ in }.asDriver
    }
}
