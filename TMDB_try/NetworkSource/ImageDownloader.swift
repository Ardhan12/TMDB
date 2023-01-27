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
}

