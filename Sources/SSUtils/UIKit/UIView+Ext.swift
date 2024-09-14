//
//  UIView+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 24/03/2023.
//

import UIKit

public extension UIView {
    func embeddedInView(with margins: NSDirectionalEdgeInsets) -> UIView {
        let view = UIView()
        view.directionalLayoutMargins = margins
        view.addSubview(self)
        edges(equalTo: view.layoutMarginsGuide)
        return view
    }

    func edges(equalTo layoutGuide: UILayoutGuide) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
        ])
    }
}
