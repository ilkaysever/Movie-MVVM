//
//  MovieDetailViewModel.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 25.01.2023.
//

import Foundation

protocol MovieDetailViewModelProtocol: AnyObject {
    func requestMovieDetail(id: Int?)
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    public var didSuccess: ()->() = { }
    public var didFailure: (String)->() = { _ in }
    
    var movieItem: MovieItem?
    
    func requestMovieDetail(id: Int?) {
        MovieDetailRequest.shared.requestLatestMovie(id: id ?? 0) { [weak self] data in
            guard let self = self else { return }
            self.movieItem = data
            self.didSuccess()
        }
    }
    
}
