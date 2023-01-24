//
//  UIView+Ext.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 25.01.2023.
//

import UIKit

extension UIView {
    
    func topCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively
    }

    func bottomCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner] // Bottom right corner, Bottom left corner respectively
    }
    
}

