//
//  CombineHelper.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 01/04/2022.
//

import Combine

public protocol CombineHelper: AnyObject {
    var cancellables: Set<AnyCancellable> { get set }
}
