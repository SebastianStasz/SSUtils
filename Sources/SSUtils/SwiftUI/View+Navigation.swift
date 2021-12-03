//
//  View+Navigation.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 03/12/2021.
//

import SwiftUI

public extension View {

    func onNavigation(_ action: @escaping () -> Void) -> some View {
        Button(action: action) { self }
    }

    func navigation<Item, Destination: View>(item: Binding<Item?>, @ViewBuilder destination: (Item) -> Destination) -> some View {
        let isActive = Binding(
            get: { item.wrappedValue != nil },
            set: { if !$0 { item.wrappedValue = nil } }
        )
        return navigation(isActive: isActive) {
            item.wrappedValue.map(destination)
        }
    }

    func navigation<Destination: View>(isActive: Binding<Bool>, @ViewBuilder destination: () -> Destination) -> some View {
        overlay(NavigationLink(destination: destination(), isActive: isActive) {})
    }
}
