//
//  NetworkManager.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 22.01.2023.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private func request<T: Codable>(type: T.Type, url: String, method: HTTPMethod, completion: @escaping((Result<T, ErrorType>)->())) {
        AF.request(url, method: method).responseData { response in
            switch response.result {
            case .success(let data):
                self.handleResponse(data: data) { response in
                    completion(response)
                }
            case .failure(_):
                completion(.failure(.generalError))
            }
        }
    }
    
    private func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorType>)->())) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.invalidData))
        }
    }
    
}
