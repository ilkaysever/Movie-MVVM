//
//  MovieDetailVC.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 23.01.2023.
//

import UIKit

final class MovieDetailVC: BaseViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaselabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var footerView: UIView!
    
    let viewModel = MovieDetailViewModel()
    var movieID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchLatestMovies()
        
    }
    
    private func fetchLatestMovies() {
        viewModel.requestMovieDetail(id: movieID)
        viewModel.didSuccess = {
            let model = self.viewModel.movieItem
            guard let title = model?.originalTitle,
                  let desc = model?.overview,
                  let releaseDate = model?.releaseDate,
                  let posterPath = model?.backdropPath else { return }
            let imgUrl = NetworkHelper.shared.imgBaseURL + posterPath
            
            self.posterView.setImageUrl(imageUrl: imgUrl)
            self.titleLabel.text = title
            self.releaselabel.text = releaseDate
            self.descLabel.text = desc
            
            self.navigationTitle(title: self.viewModel.movieItem?.originalTitle)
        }
    }
    
    private func setupUI() {
        bottomView.topCornerRadius(radius: 20)
        bottomView.backgroundColor = AppColors.tabBarColor
        footerView.backgroundColor = AppColors.backgroundColor
    }

}
