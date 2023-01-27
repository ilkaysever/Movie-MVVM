//
//  SearchViewModel.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 25.01.2023.
//

import Foundation

protocol SearchViewModelProtocol: AnyObject {
    func fetchSearch(query: String)
    func requestTvSeries()
    func requestTopRatedTvSeries()
}

final class SearchViewModel: SearchViewModelProtocol {
    
    public var didSuccess: ()->() = { }
    public var didFailure: (String)->() = { _ in }
    
    var searchData: MovieResponseModel?
    
    var seriesData: MovieResponseModel?
    var seriesItem: [MovieItem]?
    
    var ratedData: MovieResponseModel?
    var ratedItem: [MovieItem]?
    
    func fetchSearch(query: String) {
        MovieRequests.shared.requestSeriesSearch(query: query) { [weak self] data in
            guard let self = self else { return }
            self.searchData = data
            self.didSuccess()
        }
    }
    
    func requestTvSeries() {
        TvSeriesRequest.shared.requestTvSeries { [weak self] data in
            guard let self = self else { return }
            if let data = data, let results = data.results {
                self.seriesData = data
                self.seriesItem = results
                self.didSuccess()
            } else {
                self.didFailure(ErrorType.invalidData.rawValue)
            }
        }
    }
    
    func requestTopRatedTvSeries() {
        TvSeriesRequest.shared.requestTopRatedTvSeries { [weak self] data in
            guard let self = self else { return }
            self.ratedData = data
            self.ratedItem = data?.results
            self.didSuccess()
        }
    }
    
}
