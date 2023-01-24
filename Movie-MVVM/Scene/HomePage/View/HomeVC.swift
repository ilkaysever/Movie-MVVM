//
//  HomeVC.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 22.01.2023.
//

import UIKit

final class HomeVC: BaseViewController {
    
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
            self.tableView.reloadData()
        }
    }
    
    private func openDetail(movieID: Int?) {
        let vc = MovieDetailVC()
        vc.movieID = movieID
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func configureTableView() {
        tableView.backgroundColor = AppColors.backgroundColor
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieListCell.self)
    }

}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieItem?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieListCell.self), for: indexPath) as? MovieListCell else { return UITableViewCell() }
        cell.configureMovieListCell(model: viewModel.movieItem?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetail(movieID: viewModel.movieItem?[indexPath.row].movieID)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
