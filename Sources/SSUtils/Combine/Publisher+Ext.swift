//
//  Publisher+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 06/11/2021.
//

import Combine

public extension Publisher {

    func onNext(_ perform: @escaping (Output) -> Void) -> AnyPublisher<Output, Failure> {
        handleEvents(receiveOutput: { perform($0) }).eraseToAnyPublisher()
    }

    func map<O: AnyObject, T>(with object: O, transform: @escaping (O, Output) -> T) -> AnyPublisher<T, Failure> {
        compactMap { [weak object] in
            guard let object = object else { return nil }
            return transform(object, $0)
        }
        .eraseToAnyPublisher()
    }

    func flatMap<O: AnyObject, T>(with object: O, transform: @escaping (O, Output) -> AnyPublisher<T, Failure>) -> AnyPublisher<T, Failure> {
        flatMap { [weak object] in
            guard let object = object else {
                return Empty<T, Failure>().eraseToAnyPublisher()
            }
            return transform(object, $0)
        }
        .eraseToAnyPublisher()
    }

    func onNext<T: AnyObject>(on object: T, perform: @escaping (T, Output) -> Void) -> AnyPublisher<Output, Failure> {
        handleEvents(receiveOutput:  { [weak object] output in
            guard let object = object else { return }
            perform(object, output)
        })
        .eraseToAnyPublisher()
    }

    /// Executes a unit of asynchronous work and returns its result to the downstream subscriber.
    ///
    /// - Parameter transform: A closure that takes an element as a parameter and returns a publisher that produces elements of that type.
    /// - Returns: A publisher that transforms elements from an upstream  publisher into a publisher of that element's type.
    func asyncMap<T>(_ transform: @escaping (Output) async -> T) -> AnyPublisher<T, Failure> {
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

    /// Executes a unit of asynchronous work and returns its result to the downstream subscriber. Can throw an error.
    /// - Parameter transform: A closure that takes an element as a parameter and returns a publisher that produces elements of that type.
    /// - Returns: A publisher that transforms elements from an upstream  publisher into a publisher of that element's type.
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

    /// Executes a unit of asynchronous work and returns its result to the downstream subscriber. Can throw an error.
    /// - Parameter transform: A closure that takes an element as a parameter and returns a publisher that produces elements of that type.
    /// - Returns: A publisher that transforms elements from an upstream  publisher into a publisher of that element's type.
    func `await`<O: AnyObject, T>(on object: O, transform: @escaping (O, Output) async throws -> T) -> Publishers.FlatMap<Future<T, Error>, Publishers.SetFailureType<Self, Error>> {
        flatMap { value in
            Future { [weak object] promise in
                guard let object = object else { return }
                Task {
                    do {
                        let output = try await transform(object, value)
                        promise(.success(output))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
        }
    }

    /// Executes a unit of asynchronous work and returns its result to the downstream subscriber. Can throw an error.
    /// - Parameter transform: A closure that takes an element as a parameter and returns a publisher that produces elements of that type.
    /// - Returns: A publisher that transforms elements from an upstream  publisher into a publisher of that element's type.
    func `await`<O: AnyObject, T>(on object: O?, perform: @escaping (O, Output) async throws -> T) -> Publishers.FlatMap<Future<T, Error>, Publishers.SetFailureType<Self, Error>> {
        flatMap { value in
            Future { [weak object] promise in
                guard let object = object else { return }
                Task {
                    do {
                        let output = try await perform(object, value)
                        promise(.success(output))
                    } catch {
                        promise(.failure(error))
                    }
                }
            }
        }
    }

    /// Includes the current element as well as the previous element from the upstream publisher in a tuple where the previous element is optional.
    /// The first time the upstream publisher emits an element, the previous element will be `nil`.
    /// - Returns: A publisher of a tuple of the previous and current elements from the upstream publisher.
    func withPrevious() -> AnyPublisher<(previous: Output?, current: Output), Failure> {
        scan(Optional<(Output?, Output)>.none) { ($0?.1, $1) }
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }

    /// Includes the current element as well as the previous element from the upstream publisher in a tuple where the previous element is not optional.
    /// The first time the upstream publisher emits an element, the previous element will be the `initialPreviousValue`.
    /// - Parameter initialPreviousValue: The initial value to use as the "previous" value when the upstream publisher emits for the first time.
    /// - Returns: A publisher of a tuple of the previous and current elements from the upstream publisher.
    func withPrevious(startWith initialPreviousValue: Output) -> AnyPublisher<(previous: Output, current: Output), Failure> {
        scan((initialPreviousValue, initialPreviousValue)) { ($0.1, $1) }.eraseToAnyPublisher()
    }
}

public extension Publisher where Output == String {

    func lowerCaseDiacriticInsensitive() -> AnyPublisher<String, Self.Failure> {
        self.map { $0.lowerCaseDiacriticInsensitive }
        .eraseToAnyPublisher()
    }
}
