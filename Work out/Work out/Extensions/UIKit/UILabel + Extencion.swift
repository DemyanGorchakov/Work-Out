//
//  UILabel + Extencion.swift
//  Work out
//
//  Created by Демьян Горчаков on 30.06.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String = "") {
        self.init()
        self.text = text
        self.textColor = .specialLightBrown
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
