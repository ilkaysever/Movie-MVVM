//
//  MovieModel.swift
//  Movie-MVVM
//
//  Created by İlkay Sever on 23.01.2023.
//

import Foundation

struct MovieModel: Codable {
    var page: Int?
    var results: [MovieItems]?
    var totalPages: Int?
    var totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieItems: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var movieID: Int?
    var originalTitle: String?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case movieID = "id"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
