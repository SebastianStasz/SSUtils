//
//  Publisher+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 06/11/2021.
//

import Combine

public extension Publisher {
    func asyncMap<T>(
        _ transform: @escaping (Output) async -> T
    ) -> Publishers.FlatMap<AnyPublisher<T, Never>, Self> {
        flatMap { value in
            Future { promise in
                Task {
                    let output = await transform(value)
                    promise(.success(output))
                }
            }
            .eraseToAnyPublisher()
        }
    }
}