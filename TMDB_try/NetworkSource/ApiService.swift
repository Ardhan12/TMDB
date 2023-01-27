////
////  ApiService.swift
////  TMDB_try
////
////  Created by Arief Ramadhan on 28/12/22.
////
//
//import Foundation
//class ApiService {
//    private var dataTask: URLSessionDataTask?
//
//    func getPopularMoviesData(completion: @escaping (Result<moviesData, Error>) -> Void) {
//        let popularMoviesURL = "https://api.themoviedb.org/3/tv/popular?api_key=6e6d4b941240cc930578737ea50b155c&language=en-US&page=1"
//
//        guard let url = URL(string: popularMoviesURL) else { return }
//
////        create URL session - work on background
//        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                completion(.failure(error))
//                print("DataTask error: \(error.localizedDescription)")
//                return
//            }
//            guard let response = response as? HTTPURLResponse else {
//                print("Empty Response")
//                return
//            }
//            print("Response status code: \(response.statusCode)")
//
//            guard let data = data else {
//                print("Empty Data")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(moviesData.self, from: data)
//
//                DispatchQueue.main.async {
//                    completion(.success(jsonData))
//                }
//            } catch let error {
//                completion(.failure(error))
//            }
//        }
//        dataTask?.resume()
//    }
//}
