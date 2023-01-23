//
//  HomeViewController.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 22.01.2023.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTableView()
        fetchLatestMovies()
    }
    
    private func setupUI() {
        navigationTitle(title: "Popüler Filmler")
    }
    
    private func fetchLatestMovies() {
        viewModel.fetchLatestMovies()
        viewModel.didSuccess = {
            
        }
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
