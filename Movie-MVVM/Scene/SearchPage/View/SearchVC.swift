//
//  SearchVC.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 23.01.2023.
//

import UIKit

enum Section: Int, CaseIterable {
    case tvSeries
    case topRatedMovies
}

final class SearchVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
        configureTableView()
        requestSearch()
    }
    
    private func setupUI() {
        view.backgroundColor = AppColors.backgroundColor
        navigationTitle(title: "Keşfet")
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
    }
    
    private func fetchTopRatedTvSeries() {
        viewModel.requestTopRatedTvSeries()
        viewModel.didSuccess = {
            self.tableView.reloadData()
        }
    }
    
    private func requestSearch() {
        viewModel.fetchSearch(query: "titanic")
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
        tableView.register(ListTableCell.self)
    }
    
}

extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListTableCell.self), for: indexPath) as? ListTableCell else { return UITableViewCell() }
        cell.delegate = self
        switch Section(rawValue: indexPath.section)! {
        case .tvSeries:
            let model = viewModel.seriesData
            cell.cellType = .series
            cell.model = model
        case .topRatedMovies:
            let model = viewModel.ratedData
            cell.cellType = .topRated
            cell.model = model
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 2.7
    }
    
}

extension SearchVC: ListTableCellDelegate {
    func didTappedDetail(id: Int) {
        openDetail(id: id)
    }
}
