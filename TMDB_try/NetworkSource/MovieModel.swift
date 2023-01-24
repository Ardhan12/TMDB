//
//  MovieModel.swift
//  TMDB_try
//
//  Created by Arief Ramadhan on 02/01/23.
//

import Foundation
import UIKit

enum DownloadState {
    case new, downloaded, failed
}

class MovieFilm {
    let title: String
    var poster: URL
    
    var image: UIImage?
    var state: DownloadState = .new
    
 
    init(title: String, poster: URL) {
        self.title = title
        self.poster = poster
    }
}

let movies = [
  MovieFilm(
    title: "Thor: Love and Thunder",
    poster: URL(string: "https://image.tmdb.org/t/p/w500/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg")!
  ), MovieFilm(
    title: "Minions: The Rise of Gru",
    poster: URL(string: "https://image.tmdb.org/t/p/w500/wKiOkZTN9lUUUNZLmtnwubZYONg.jpg")!
  ), MovieFilm(
    title: "Jurassic World Dominion",
    poster: URL(string: "https://image.tmdb.org/t/p/w500/kAVRgw7GgK1CfYEJq8ME6EvRIgU.jpg")!
  ), MovieFilm(
    title: "Top Gun: Maverick",
    poster: URL(string: "https://image.tmdb.org/t/p/w500/62HCnUTziyWcpDaBO2i1DX17ljH.jpg")!
  ), MovieFilm(
    title: "The Gray Man",
    poster: URL(string: "https://image.tmdb.org/t/p/w500/8cXbitsS6dWQ5gfMTZdorpAAzEH.jpg")!
  ), MovieFilm(
    title: "The Black Phone",
    poster: URL(string: "https://image.tmdb.org/t/p/w500/p9ZUzCyy9wRTDuuQexkQ78R2BgF.jpg")!
  ), MovieFilm(
    title: "Lightyear",
    poster: URL(string: "https://image.tmdb.org/t/p/w500/ox4goZd956BxqJH6iLwhWPL9ct4.jpg")!
  ), MovieFilm(
    title: "Doctor Strange in the Multiverse of Madness",
    poster: URL(string: "https://image.tmdb.org/t/p/w500/9Gtg2DzBhmYamXBS1hKAhiwbBKS.jpg")!
  ), MovieFilm(
    title: "Indemnity",
    poster: URL(string: "https://image.tmdb.org/t/p/w500/tVbO8EAbegVtVkrl8wNhzoxS84N.jpg")!
  ), MovieFilm(
    title: "Borrego",
    poster: URL(string: "https://image.tmdb.org/t/p/w500/kPzQtr5LTheO0mBodIeAXHgthYX.jpg")!
  )
]

