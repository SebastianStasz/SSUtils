//
//  CombineUtils.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 11/12/2021.
//

import Combine

public typealias Driver<T> = AnyPublisher<T, Never>
public typealias DriverSubject<T> = PassthroughSubject<T, Never>
public typealias CombineLatest = Publishers.CombineLatest
public typealias CombineLatest3 = Publishers.CombineLatest3
public typealias CombineLatest4 = Publishers.CombineLatest4
