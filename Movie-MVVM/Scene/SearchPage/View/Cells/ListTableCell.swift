//
//  ListTableCell.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 25.01.2023.
//

import UIKit

enum CellType {
    case series
    case topRated
}

protocol ListTableCellDelegate: AnyObject {
    func didTappedDetail(id: Int)
}

final class ListTableCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: ListTableCellDelegate?
    
    var identifier: Int?
    var cellType: CellType? {
        didSet {
            configureCell()
        }
    }
    
    var model: MovieResponseModel? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        configureCollectionView()
    }
    
    private func setupUI() {
        contentView.backgroundColor = AppColors.backgroundColor
    }
    
    func configureCell() {
        switch cellType {
        case .series:
            titleLabel.text = "Popüler Diziler"
        case .topRated:
            titleLabel.text = "IMDB Top 250 Diziler"
        default:
            break
        }
    }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = AppColors.backgroundColor
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CardCollectionCell.self)
    }

}

extension ListTableCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let model = model?.results?.count else { return 0 }
        return model != 0 ? model : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CardCollectionCell.self), for: indexPath) as? CardCollectionCell else { return UICollectionViewCell() }
        switch cellType {
        case .series:
            cell.configureCardCell(model: model?.results?[indexPath.row])
        case .topRated:
            cell.configureCardCell(model: model?.results?[indexPath.row])
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch cellType {
        case .series:
            debugPrint(indexPath.row)
            identifier = model?.results?[indexPath.row].id
            delegate?.didTappedDetail(id: identifier ?? 0)
        case .topRated:
            debugPrint(indexPath.row)
            identifier = model?.results?[indexPath.row].id
            delegate?.didTappedDetail(id: identifier ?? 0)
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        let width = height * 0.55
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
}
