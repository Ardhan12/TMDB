////
////  Model.swift
////  TMDB_try
////
////  Created by Arief Ramadhan on 28/12/22.
////
//
//import Foundation
//
//struct moviesData: Decodable {
//    let movies: [Movie]
//    
//    private enum CodingKeys: String, CodingKey {
//        case movies = "results"
//    }
//}
//
//struct Movie: Decodable {
//    let title: String?
//    let year: String?
//    let rate: String?
//    let posterImage: String?
//    let overview: String?
//    
//    private enum CodingKeys: String, CodingKey {
//        case title, overview
//        case year = "release_date"
//        case rate = "vote_avarage"
//        case posterImage = "poster_path"
//    }
//}
