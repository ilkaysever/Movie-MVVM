//
//  MovieRequests.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 23.01.2023.
//

import Foundation

class MovieRequests {
    
    static let shared = MovieRequests()
    
    func requestLatestMovie(completion: @escaping (MovieResponseModel?) -> ()) {
        guard let url = URL(string: "\(NetworkHelper.shared.baseURL)/movie/popular?api_key=c8663b3a5e6e1d41ab253805b21e4d6e&language=en-US&page=1") else { return }
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
