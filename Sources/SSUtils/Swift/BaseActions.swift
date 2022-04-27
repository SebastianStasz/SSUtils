//
//  BaseActions.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 26/04/2022.
//

import Foundation

public protocol BaseActions: AnyObject {}

public extension BaseActions {
    func onSelf(_ action: @escaping (Self) -> Void) -> () -> Void {
        return { [weak self] in
            guard let strongSelf = self else {
                return
            }
            action(strongSelf)
        }
    }
}
