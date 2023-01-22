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

enum ErrorType: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Inlavid Url"
    case generalError = "An error happened"
}

class NetworkHelper {
    
    static let shared = NetworkHelper()
    let baseURL = "https://api.themoviedb.org/3"
    
}
