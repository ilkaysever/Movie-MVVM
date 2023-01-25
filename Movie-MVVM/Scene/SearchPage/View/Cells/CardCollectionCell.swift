//
//  CardCollectionCell.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 25.01.2023.
//

import UIKit

class CardCollectionCell: UICollectionViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        
    }
    
    private func setupUI() {
        imgView.layer.cornerRadius = 8
        imgView.clipsToBounds = true
    }
    
    func configureCardCell(model: MovieItem?) {
        let imgUrl = Constants.imgBaseURL + (model?.posterPath ?? "")
        imgView.setImageUrl(imageUrl: imgUrl)
        titleLabel.text = model?.name
    }

}
