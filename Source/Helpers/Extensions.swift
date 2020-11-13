//
//  Extensions.swift
//  Reminder
//
//  Created by ayur on 13/11/2020.
//  Copyright © 2020 ayur-team. All rights reserved.
//

import UIKit

enum Sides {
    case leading
    case trailing
    case top
    case bottom
    case all
}

extension UIView {
    
    func widthHeightAnchor(width inWidth: CGFloat, height inHeight: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: inWidth).isActive = true
        heightAnchor.constraint(equalToConstant: inHeight).isActive = true
    }

    func padding(to toView: UIView, sides: [Sides], length: CGFloat) {
        if !subviews.contains(toView) {
            print("The view (\(toView)) is not a subview of \(self)")
            print("The method padding will not work.")
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        var newAnchors: [NSLayoutConstraint] = []

        for side in sides {
            switch side {
            case .leading:
                let lAnchor = leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: length)
                newAnchors.append(lAnchor)
            case .trailing:
                let tAnchor = trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: length)
                newAnchors.append(tAnchor)
            case .top:
                let toAnchor = topAnchor.constraint(equalTo: toView.topAnchor, constant: length)
                newAnchors.append(toAnchor)
            case .bottom:
                let bAnchor = bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: length)
                newAnchors.append(bAnchor)
            case .all:
                let lAnchor = leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: length)
                newAnchors.append(lAnchor)
                let tAnchor = trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: length)
                newAnchors.append(tAnchor)
                let toAnchor = topAnchor.constraint(equalTo: toView.topAnchor, constant: length)
                newAnchors.append(toAnchor)
                let bAnchor = bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: length)
                newAnchors.append(bAnchor)
            }
        }
        NSLayoutConstraint.activate(newAnchors)
    }

    func padding(to toView: UIView, sides: Sides, length: CGFloat) {
        if !subviews.contains(toView) {
            print("The view (\(toView)) is not a subview of \(self)")
            print("The method padding will not work.")
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        var newAnchors: [NSLayoutConstraint] = []

        switch sides {
        case .leading:
            let lAnchor = leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: length)
            newAnchors.append(lAnchor)
        case .trailing:
            let tAnchor = trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: length)
            newAnchors.append(tAnchor)
        case .top:
            let toAnchor = topAnchor.constraint(equalTo: toView.topAnchor, constant: length)
            newAnchors.append(toAnchor)
        case .bottom:
            let bAnchor = bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: length)
            newAnchors.append(bAnchor)
        case .all:
            let lAnchor = leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: length)
            newAnchors.append(lAnchor)
            let tAnchor = trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: length)
            newAnchors.append(tAnchor)
            let toAnchor = topAnchor.constraint(equalTo: toView.topAnchor, constant: length)
            newAnchors.append(toAnchor)
            let bAnchor = bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: length)
            newAnchors.append(bAnchor)
        }

        NSLayoutConstraint.activate(newAnchors)
    }
}
