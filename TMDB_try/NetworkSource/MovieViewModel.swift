////
////  MovieViewModel.swift
////  TMDB_try
////
////  Created by Arief Ramadhan on 28/12/22.
////
//
//import Foundation
//class MovieViewModel {
//    private var apiService = ApiService()
//    private var populerMovies = [Movie]()
//    
//    func fetchPopularMoviesData(completion: @escaping () -> ()) {
//        apiService.getPopularMoviesData{ [weak self] (result) in
//            switch result {
//            case .success(let listOf):
//                self?.populerMovies = listOf.movies
//                completion()
//            case .failure(let error):
//                print("Error processing json data: \(error)")
//            }
//        }
//    }
//    
//    func numberOfRowsInSection(section: Int) -> Int {
//        if populerMovies.count != 0 {
//            return populerMovies.count
//        }
//        return 0
//    }
//    
//    func cellForRowAt ( indexPath: IndexPath) -> Movie {
//        return populerMovies[indexPath.row]
//    }
//}
// 
