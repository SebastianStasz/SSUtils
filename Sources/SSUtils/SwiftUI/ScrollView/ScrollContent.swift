//
//  ScrollContent.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 14/02/2022.
//

import SwiftUI

public struct ScrollContent<Content: View>: View {
    private let spaceName = "scrollView"
    @State private var wholeContentSize: CGSize = .zero
    @State private var scrollViewSize: CGSize = .zero
    @State private var offsetValue: CGFloat = .zero

    public let axes: Axis.Set
    public let showsIndicators: Bool
    private let offsetChanged: ((CGFloat) -> Void)?
    @Binding private var scrollViewArea: ScrollViewArea
    @ViewBuilder private let content: Content

    public init(
        _ axes: Axis.Set = .vertical,
        showsIndicators: Bool = true,
        offsetChanged: ((CGFloat) -> Void)? = nil,
        scrollViewArea: Binding<ScrollViewArea>? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.offsetChanged = offsetChanged
        self._scrollViewArea = scrollViewArea ?? .constant(.top)
        self.content = content()
    }

    public var body: some View {
        SizeReader($wholeContentSize) {
            ScrollView {
                SizeReader($scrollViewSize) { content }
                    .background(geometryReader)
                    .onPreferenceChange(ViewOffsetPreferenceKey.self) {
                        offsetValue = $0
                        preferenceChanged($0)
                    }
            }
        }
        .coordinateSpace(name: spaceName)
        .onChange(of: scrollViewSize) { _ in updateScrollViewArea() }
    }

    private func preferenceChanged(_ offset: CGFloat) {
        offsetChanged?(offset)
        updateScrollViewArea()
    }

    private func updateScrollViewArea() {
        guard scrollViewSize.height > wholeContentSize.height else {
            scrollViewArea = .notScrollable
            return
        }
        if offsetValue <= 0 {
            scrollViewArea = .top
        } else if offsetValue >= scrollViewSize.height - 1 - wholeContentSize.height {
            scrollViewArea = .bottom
        } else {
            scrollViewArea = .between
        }
    }

    private var geometryReader: some View {
        GeometryReader { proxy in
            Color.clear.preference(
                key: ViewOffsetPreferenceKey.self,
                value: -1 * proxy.frame(in: .named(spaceName)).origin.y
            )
        }
    }
}
