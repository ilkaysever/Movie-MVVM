//
//  MovieViewModel.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 23.01.2023.
//

import Foundation

protocol MovieViewModelProtocol: AnyObject {
    func fetchLatestMovies()
    func fetchSeriesDetail()
}

final class MovieViewModel: MovieViewModelProtocol {
    
    public var didSuccess: ()->() = { }
    public var didFailure: (String)->() = { _ in }
    
    var movieData: MovieResponseModel?
    var movieItem: [MovieItem]?
    
    func fetchLatestMovies() {
        MovieRequests.shared.requestLatestMovie { [weak self] data in
            guard let self = self else { return }
            self.movieData = data
            self.movieItem = data?.results
            self.didSuccess()
        }
    }
    
    func fetchSeriesDetail() {
        MovieRequests.shared.requestLatestMovie { [weak self] data in
            guard let self = self else { return }
            if let data = data, let results = data.results {
                self.movieData = data
                self.movieItem = results
                self.didSuccess()
            } else {
                self.didFailure(ErrorType.invalidURL.rawValue)
            }
        }
    }
    
}
