//
//  ActivityView.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 05/04/2022.
//

import SwiftUI

private struct ActivityView: UIViewControllerRepresentable {

    @Binding var activityAction: ActivityAction?
    private var permittedArrowDirections: UIPopoverArrowDirection
    private var completion: UIActivityViewController.CompletionWithItemsHandler?

    init(
        activityAction: Binding<ActivityAction?>,
        permittedArrowDirections: UIPopoverArrowDirection,
        onComplete: UIActivityViewController.CompletionWithItemsHandler? = nil
    ) {
        self._activityAction = activityAction
        self.permittedArrowDirections = permittedArrowDirections
        self.completion = onComplete
    }

    func makeUIViewController(context: Context) -> ActivityViewControllerWrapper {
        ActivityViewControllerWrapper(activityAction: $activityAction, permittedArrowDirections: permittedArrowDirections, onComplete: completion)
    }

    func updateUIViewController(_ controller: ActivityViewControllerWrapper, context: Context) {
        controller.activityAction = $activityAction
        controller.updateState()
    }
}

public extension View {
    func activitySheet(
        _ activityAction: Binding<ActivityAction?>,
        permittedArrowDirections: UIPopoverArrowDirection = .any,
        onComplete completion: UIActivityViewController.CompletionWithItemsHandler? = nil
    ) -> some View {
        background(ActivityView(activityAction: activityAction, permittedArrowDirections: permittedArrowDirections, onComplete: completion))
    }
}

// MARK: - Preview

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activityAction: .constant(.init(items: "Text to share")), permittedArrowDirections: .any)
    }
}
