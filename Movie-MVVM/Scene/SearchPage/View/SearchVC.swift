//
//  SearchVC.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 23.01.2023.
//

import UIKit

enum Section: Int, CaseIterable {
    case searchList
    case tvSeries
    case topRatedMovies
}

final class SearchVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = SearchViewModel()
    let searchController = UISearchController()
    var query: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
        configureTableView()
    }
    
    private func setupUI() {
        view.backgroundColor = AppColors.backgroundColor
        navigationTitle(title: "Keşfet")
        
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        searchController.searchBar.tintColor = .white
    }
    
    private func setupBinding() {
        DispatchQueue.main.async {
            self.fetchTvSeries()
            self.fetchTopRatedTvSeries()
        }
    }
    
    private func fetchTvSeries() {
        viewModel.requestTvSeries()
        viewModel.didSuccess = {
            self.tableView.reloadData()
        }
        viewModel.didFailure = { error in
            debugPrint(error)
        }
    }
    
    private func fetchTopRatedTvSeries() {
        viewModel.requestTopRatedTvSeries()
        viewModel.didSuccess = {
            self.tableView.reloadData()
        }
    }
    
    private func requestSearch(query: String) {
        viewModel.fetchSearch(query: query)
        viewModel.didSuccess = {
            self.tableView.reloadData()
        }
    }
    
    private func openDetail(id: Int?) {
        let vc = MovieDetailVC()
        vc.identifier = id
        vc.viewType = .series
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func configureTableView() {
        tableView.backgroundColor = AppColors.backgroundColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedSectionHeaderHeight = 0
        tableView.register(MovieListCell.self)
        tableView.register(ListTableCell.self)
    }
    
}

extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
        case .searchList:
            if query != nil && query != "" {
                return viewModel.searchData?.results?.count ?? 0
            } else {
                return 0
            }
        case .tvSeries, .topRatedMovies:
            if query != nil && query != "" {
                return 0
            } else {
                return 1
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section)! {
        case .searchList:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieListCell.self), for: indexPath) as? MovieListCell else { return UITableViewCell() }
            cell.configureMovieListCell(model: viewModel.searchData?.results?[indexPath.row])
            return cell
        case .tvSeries:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListTableCell.self), for: indexPath) as? ListTableCell else { return UITableViewCell() }
            cell.delegate = self
            let model = viewModel.seriesData
            cell.cellType = .series
            cell.model = model
            return cell
        case .topRatedMovies:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListTableCell.self), for: indexPath) as? ListTableCell else { return UITableViewCell() }
            cell.delegate = self
            let model = viewModel.ratedData
            cell.cellType = .topRated
            cell.model = model
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Section(rawValue: indexPath.section)! {
        case .searchList:
            debugPrint(indexPath.row)
            let identifier = viewModel.searchData?.results?[indexPath.row].id
            openDetail(id: identifier)
        case .tvSeries, .topRatedMovies:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Section(rawValue: indexPath.section)! {
        case .searchList:
            return UITableView.automaticDimension
        case .tvSeries, .topRatedMovies:
            return UIScreen.main.bounds.height / 2.7
        }
    }
    
}

extension SearchVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        query = text
        requestSearch(query: query ?? "")
    }
    
}

extension SearchVC: ListTableCellDelegate {
    
    func didTappedDetail(id: Int) {
        openDetail(id: id)
    }
    
}
