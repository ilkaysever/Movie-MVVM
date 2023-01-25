//
//  MovieDetailVC.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 23.01.2023.
//

import UIKit

enum ViewType {
    case movie
    case series
}

final class MovieDetailVC: BaseViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaselabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var footerView: UIView!
    
    let viewModel = DetailViewModel()
    var identifier: Int?
    var viewType: ViewType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
    }
    
    private func setupBinding() {
        DispatchQueue.main.async {
            switch self.viewType {
            case .movie:
                self.fetchMoviesDetail()
            case .series:
                self.fetchSeriesDetail()
            default:
                break
            }
        }
    }
    
    private func fetchMoviesDetail() {
        viewModel.requestMovieDetail(id: identifier)
        viewModel.didSuccess = {
            guard let model = self.viewModel.modelItem else { return }
            let imgUrl = Constants.imgBaseURL + (model.backdropPath ?? "")
            
            self.posterView.setImageUrl(imageUrl: imgUrl)
            self.titleLabel.text = model.originalTitle
            self.releaselabel.text = model.releaseDate
            self.descLabel.text = model.overview
            
            self.navigationTitle(title: self.viewModel.modelItem?.originalTitle)
        }
    }
    
    private func fetchSeriesDetail() {
        viewModel.requestSeriesDetail(id: identifier)
        viewModel.didSuccess = {
            guard let model = self.viewModel.modelItem else { return }
            let imgUrl = Constants.imgBaseURL + (model.backdropPath ?? "")
            
            self.posterView.setImageUrl(imageUrl: imgUrl)
            self.titleLabel.text = model.name
            self.releaselabel.text = model.releaseDate
            self.descLabel.text = model.overview
            
            self.navigationTitle(title: self.viewModel.modelItem?.name)
        }
    }
    
    private func setupUI() {
        bottomView.topCornerRadius(radius: 20)
        bottomView.backgroundColor = AppColors.tabBarColor
        footerView.backgroundColor = AppColors.backgroundColor
    }
    
}
