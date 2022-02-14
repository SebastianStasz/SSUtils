//
//  SizeReader.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 14/02/2022.
//

import SwiftUI

public struct SizeReader<Content: View>: View {
    @Binding private var size: CGSize
    @ViewBuilder private let content: Content

    public init(_ size: Binding<CGSize>, content: () -> Content) {
        self._size = size
        self.content = content()
    }

    public var body: some View {
        content
            .background(geometryReader)
            .onPreferenceChange(SizePreferenceKey.self) { size = $0 }
    }

    private var geometryReader: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
        }
    }
}


// MARK: - Preview

struct SizeReader_Previews: PreviewProvider {
    static var previews: some View {
        SizeReader(.constant(.zero)) {
            Text("View")
        }
    }
}
