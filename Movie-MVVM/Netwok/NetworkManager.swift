//
//  NetworkManager.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 22.01.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Codable>(type: T.Type, url: String, method: HTTPMethod, completion: @escaping((Result<T, ErrorType>)->())) {
        AF.request(url, method: method).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(_):
                completion(.failure(.generalError))
            }
        }
    }
    
}
