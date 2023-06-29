//
//  UIView + Extension.swift
//  Work out
//
//  Created by Демьян Горчаков on 09.05.2023.
//

import UIKit

extension UIView {
    func addShadowView() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1.0
    }
}
