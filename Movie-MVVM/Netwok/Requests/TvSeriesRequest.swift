//
//  TvSeriesRequest.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 26.01.2023.
//

import Foundation

class TvSeriesRequest {
    
    static let shared = TvSeriesRequest()
    
    func requestTvSeries(completion: @escaping (MovieResponseModel?) -> ()) {
        guard let url = URL(string: "\(Constants.BASE_URL)/tv/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
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
    
    func requestTopRatedTvSeries(completion: @escaping (MovieResponseModel?) -> ()) {
        guard let url = URL(string: "\(Constants.BASE_URL)/tv/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
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
    
    func requestSeriesDetail(id: Int, completion: @escaping (MovieItem?) -> ()) {
        guard let url = URL(string: "\(Constants.BASE_URL)/tv/\(id)?api_key=\(Constants.API_KEY)&language=en-US") else { return }
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
    
    private func handleWithError(_ error: Error) {
        debugPrint(error.localizedDescription)
    }
    
}
