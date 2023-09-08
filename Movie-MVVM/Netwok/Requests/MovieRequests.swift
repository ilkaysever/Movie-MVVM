//
//  MovieRequests.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 23.01.2023.
//

import Foundation

class MovieRequests {
    
    static let shared = MovieRequests()
    
    private init() {}
    
    func requestLatestMovie(completion: @escaping (MovieResponseModel?) -> ()) {
        guard let url = URL(string: "\(Constants.BASE_URL)/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
        NetworkManager.shared.request(type: MovieResponseModel.self, url: url, method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                completion(data)
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func requestMovieDetail(id: Int, completion: @escaping (MovieItem?) -> ()) {
        guard let url = URL(string: "\(Constants.BASE_URL)/movie/\(id)?api_key=\(Constants.API_KEY)&language=en-US") else { return }
        NetworkManager.shared.request(type: MovieItem.self, url: url, method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                completion(data)
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func requestSeriesSearch(query: String, completion: @escaping (MovieResponseModel?) -> ()) {
        guard let url = URL(string: "\(Constants.BASE_URL)/search/tv?api_key=\(Constants.API_KEY)&language=en-US&query=\(query)") else { return }
        NetworkManager.shared.request(type: MovieResponseModel.self, url: url, method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                completion(data)
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    private func handleWithError(_ error: Error) {
        debugPrint(error.localizedDescription)
    }
    
}
