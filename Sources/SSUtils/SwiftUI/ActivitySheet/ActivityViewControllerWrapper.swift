//
//  ActivityViewControllerWrapper.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 05/04/2022.
//

import UIKit
import SwiftUI

final class ActivityViewControllerWrapper: UIViewController {

    var activityAction: Binding<ActivityAction?>
    private var permittedArrowDirections: UIPopoverArrowDirection
    private var completion: UIActivityViewController.CompletionWithItemsHandler?

    init(activityAction: Binding<ActivityAction?>,
         permittedArrowDirections: UIPopoverArrowDirection,
         onComplete completion: UIActivityViewController.CompletionWithItemsHandler?
    ) {
        self.activityAction = activityAction
        self.permittedArrowDirections = permittedArrowDirections
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }

    func updateState() {
        guard activityAction.wrappedValue.notNil, presentedViewController.isNil else {
            return
        }
        let vc = UIActivityViewController(activityItems: activityAction.wrappedValue?.items ?? [], applicationActivities: activityAction.wrappedValue?.activities)
        vc.excludedActivityTypes = activityAction.wrappedValue?.excludedTypes
        vc.popoverPresentationController?.permittedArrowDirections = permittedArrowDirections
        vc.popoverPresentationController?.sourceView = view
        vc.completionWithItemsHandler = { [weak self] (activityType, success, items, error) in
            self?.activityAction.wrappedValue = nil
            self?.completion?(activityType, success, items, error)
        }
        present(vc, animated: true, completion: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
