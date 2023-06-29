//
//  UIStatickView + Extencion.swift
//  Work out
//
//  Created by Демьян Горчаков on 28.05.2023.
//

import UIKit

extension UIStackView {
    convenience init(arrangesSubviews: [UIView], axis: NSLayoutConstraint.Axis, spasing: CGFloat) {
        self.init(arrangedSubviews: arrangesSubviews)
        self.axis = axis
        self.spacing = spasing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
