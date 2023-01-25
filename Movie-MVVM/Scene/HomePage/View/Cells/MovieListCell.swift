//
//  MovieListCell.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 25.01.2023.
//

import UIKit

final class MovieListCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var movieImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureMovieListCell(model: MovieItem?) {
        guard let title = model?.originalTitle,
              let desc = model?.overview,
              let voteAverage = model?.voteAverage,
              let posterPath = model?.posterPath else { return }
        let imgUrl = Constants.imgBaseURL + posterPath

        titleLabel.text = title
        descLabel.text = desc
        averageLabel.text = "IMDB" + " " + "\(voteAverage)"
        movieImgView.setImageUrl(imageUrl: imgUrl)
    }

}
