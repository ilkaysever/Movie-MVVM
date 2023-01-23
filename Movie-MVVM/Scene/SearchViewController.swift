//
//  SearchViewController.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 23.01.2023.
//

import UIKit

class SearchViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .orange
        navigationTitle(title: "Film Ara")
    }

}
