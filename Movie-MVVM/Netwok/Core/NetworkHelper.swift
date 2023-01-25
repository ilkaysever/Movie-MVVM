//
//  NetworkHelper.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 22.01.2023.
//

import Foundation

//enum HTTPMethods: String {
//    case get = "GET"
//    case post = "POST"
//    case put = "PUT"
//    case delete = "DELETE"
//}

struct Constants {
    static let API_KEY = "c8663b3a5e6e1d41ab253805b21e4d6e"
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
    
    //let baseURL = "https://api.themoviedb.org/3"
    //let imgBaseURL = "https://image.tmdb.org/t/p/w500"
    
    
}
