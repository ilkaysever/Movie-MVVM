//
//  BaseViewController.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 22.01.2023.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        navigationItem.backButtonTitle = ""
        view.backgroundColor = AppColors.backgroundColor
        view.alpha = 1.0
    }
    
    func navigationTitle(title: String?) {
        guard let title = title else { return }
        navigationItem.title = title
    }
    
    //    func showLoading() {
    //        let loadingVC = LoadingVC()
    //        loadingVC.modalPresentationStyle = .overFullScreen
    //        loadingVC.modalTransitionStyle = .crossDissolve
    //        self.present(loadingVC, animated: true)
    //    }
    
    //    func stopLoading() {
    //        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    //            self.dismiss(animated: true)
    //        }
    //    }
    
}
