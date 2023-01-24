//
//  imageDownloader.swift
//  TMDB_try
//
//  Created by Arief Ramadhan on 18/01/23.
//

import Foundation
import UIKit

class ImageDownloader: Operation {
    private let movie: MovieFilm
    
    init(movie: MovieFilm) {
        self.movie = movie
    }
    
    override func main() {
        if isCancelled {
            return
        }
        guard let imageData = try? Data(contentsOf: self.movie.poster) else {return}
        
        
        if isCancelled {
            return
        }
        
        if !imageData.isEmpty {
            self.movie.image = UIImage(data: imageData)
            self.movie.state = .downloaded
        } else {
            self.movie.image = nil
            self.movie.state = .failed
        }
    }
}

class PendingOperation {
    lazy var downloadInprogress : [IndexPath: Operation] = [:]
    
    lazy var downloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "com.dicoding.imagedownload"
        queue.maxConcurrentOperationCount = 2
        
        return queue
    }()
}

