//
//  BaseNavigationController.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 22.01.2023.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurateNavigationBar()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    func configurateNavigationBar() {
        let titleStyle: [NSAttributedString.Key: Any] = [.foregroundColor: AppColors.white, .font: UIFont(name: "Ubuntu-Medium", size: 14)!]
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = titleStyle
            appearance.shadowColor = .clear
            appearance.backgroundColor = AppColors.backgroundColor
            appearance.setBackIndicatorImage(UIImage(systemName: "chevron.back"), transitionMaskImage: UIImage(systemName: "chevron.back"))
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().backgroundColor = AppColors.backgroundColor
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().isTranslucent = false
        }
    }
    
}
