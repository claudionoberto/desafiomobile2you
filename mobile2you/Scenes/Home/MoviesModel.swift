//
//  MoviesModel.swift
//  mobile2you
//
//  Created by Claudio Noberto  on 13/10/21.
//

import Foundation

struct MovieModel: Codable {
    let original_title: String
    let poster_path: String
    let vote_count: Int
    let popularity: Double
}

struct Movies: Codable {
    var results: [SimilarMovies]
}

struct SimilarMovies: Codable {
    var title: String
    var poster_path: String
    var release_date: String
    var genre_ids: [Int]
}
