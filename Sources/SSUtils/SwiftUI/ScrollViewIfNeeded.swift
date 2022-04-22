//
//  ScrollViewIfNeeded.swift
//  SSUtils
//
//  Created by sebastianstaszczyk on 22/04/2022.
//
//
// Based on: https://github.com/dkk/ScrollViewIfNeeded/blob/main/Sources/ScrollViewIfNeeded/ScrollViewIfNeeded.swift

import SwiftUI

public struct ScrollViewIfNeeded<Content>: View where Content : View {
    @State private var contentSize: CGSize = .zero
    @State private var fitsVertically = false
    @State private var fitsHorizontally = false

    private let axes: Axis.Set
    private let showsIndicators: Bool
    private let content: Content

    public init(_ axes: Axis.Set = .vertical, showsIndicators: Bool = true, @ViewBuilder content: () -> Content) {
        self.axes = axes
        self.showsIndicators = showsIndicators
        self.content = content()
    }

    private var activeScrollingDirections: Axis.Set {
        axes.intersection((fitsVertically ? [] : Axis.Set.vertical).union(fitsHorizontally ? [] : Axis.Set.horizontal))
    }

    public var body: some View {
        GeometryReader { geometryReader in
            ScrollView(activeScrollingDirections, showsIndicators: showsIndicators) {
                SizeReader($contentSize) { content }
            }
            .onReceive(NotificationCenter.keyboardDidHide) { _ in calculate(for: geometryReader) }
            .onChange(of: contentSize) { _ in calculate(for: geometryReader) }
        }
    }

    private func calculate(for proxy: GeometryProxy) {
        fitsVertically = contentSize.height <= proxy.size.height
        fitsHorizontally = contentSize.width <= proxy.size.width
    }
}
