//
//  NetworkHelper.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 22.01.2023.
//

import Foundation

struct Constants {
    static let API_KEY = "bd7847090fea4f76f5ce0c22bd1a85b8"
    static let BASE_URL = "https://api.themoviedb.org/3"
    static let imgBaseURL = "https://image.tmdb.org/t/p/w500"
}

enum ErrorType: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Inlavid Url"
    case unknownError = "An error unknown"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    
    private init() {}
    
}
