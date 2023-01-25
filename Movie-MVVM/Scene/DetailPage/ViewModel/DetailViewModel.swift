//
//  DetailViewModel.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 25.01.2023.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    func requestMovieDetail(id: Int?)
}

final class DetailViewModel: DetailViewModelProtocol {
    
    public var didSuccess: ()->() = { }
    public var didFailure: (String)->() = { _ in }
    
    var modelItem: MovieItem?
    
    func requestMovieDetail(id: Int?) {
        MovieRequests.shared.requestMovieDetail(id: id ?? 0) { [weak self] data in
            guard let self = self else { return }
            self.modelItem = data
            self.didSuccess()
        }
    }
    
    func requestSeriesDetail(id: Int?) {
        TvSeriesRequest.shared.requestSeriesDetail(id: id ?? 0) { [weak self] data in
            guard let self = self else { return }
            self.modelItem = data
            self.didSuccess()
        }
    }
    
}
