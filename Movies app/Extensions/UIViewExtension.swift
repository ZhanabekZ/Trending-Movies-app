//
//  UIViewExtension.swift
//  Movies app
//
//  Created by ZhZinekenov on 24.07.2023.
//

import Foundation
import UIKit

extension UIView {
    func round(_ radius: CGFloat = 10) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
