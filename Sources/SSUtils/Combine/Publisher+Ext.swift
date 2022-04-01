//
//  Publisher+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 06/11/2021.
//

import Combine

public extension Publisher {

    /// Executes an asyncronous call and returns its result to the downstream subscriber.
    ///
    /// - Parameter transform: A closure that takes an element as a parameter and returns a publisher that produces elements of that type.
    /// - Returns: A publisher that transforms elements from an upstream  publisher into a publisher of that element's type.
    func `await`<T>(_ transform: @escaping (Output) async -> T) -> AnyPublisher<T, Failure> {
        flatMap { value -> Future<T, Failure> in
            Future { promise in
                Task {
                    let result = await transform(value)
                    promise(.success(result))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    func `await`<T>(_ transform: @escaping (Output) async throws -> T) -> Publishers.FlatMap<Future<T, Error>, Publishers.SetFailureType<Self, Error>> {
        flatMap { value in
            Future { promise in
                Task {
                    do {
                        let output = try await transform(value)
                        promise(.success(output))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
        }
    }
}

public extension Publisher where Output == String {

    func lowerCaseDiacriticInsensitive() -> AnyPublisher<String, Self.Failure> {
        self.map { $0.lowerCaseDiacriticInsensitive }
        .eraseToAnyPublisher()
    }
}

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
        self.eraseToAnyPublisher()
    }
}
