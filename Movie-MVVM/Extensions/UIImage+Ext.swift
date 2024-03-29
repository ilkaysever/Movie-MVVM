//
//  UIImage+Ext.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 25.01.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageUrl(imageUrl: String) {
        if let url = URL(string: imageUrl) {
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url, placeholder: UIImage(named: ""))
        } else {
            self.image = UIImage(named: "")
        }
    }

}
