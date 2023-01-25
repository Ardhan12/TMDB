//
//  imageDownloader.swift
//  TMDB_try
//
//  Created by Arief Ramadhan on 18/01/23.
//

import Foundation
import UIKit

class ImageDownloader: Operation {
    func downloadImage(url: URL) async throws -> UIImage {
        async let imageData: Data = try Data(contentsOf: url)
        return UIImage(data: try await imageData)!
      }
    
//    private let movie: Movie
//
//    init(movie: Movie) {
//        self.movie = movie
//    }
//
//    override func main() {
//        if isCancelled {
//            return
//        }
//        guard let imageData = try? Data(contentsOf: self.movie.poster) else {return}
//
//
//        if isCancelled {
//            return
//        }
//
//        if !imageData.isEmpty {
//            self.movie.image = UIImage(data: imageData)
//            self.movie.state = .downloaded
//        } else {
//            self.movie.image = nil
//            self.movie.state = .failed
//        }
//    }
//}
//
//class PendingOperation {
//    lazy var downloadInprogress : [IndexPath: Operation] = [:]
//
//    lazy var downloadQueue: OperationQueue = {
//        var queue = OperationQueue()
//        queue.name = "com.dicoding.imagedownload"
//        queue.maxConcurrentOperationCount = 2
//
//        return queue
//    }()
}

