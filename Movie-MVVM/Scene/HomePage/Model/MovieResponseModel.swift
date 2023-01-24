//
//  MovieResponseModel.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 23.01.2023.
//


import Foundation

struct MovieResponseModel: Codable {
    var dates: Dates?
    var page: Int?
    var results: [MovieItem]?
    var totalPages: Int?
    var totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case dates
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Dates: Codable {
    var maximum: String?
    var minimum: String?
}
