//
//  CombineHelper.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 01/04/2022.
//

import Combine

/// Object that contains set of AnyCancellable
public protocol CombineHelper: AnyObject {
    var cancellables: Set<AnyCancellable> { get set }
}
