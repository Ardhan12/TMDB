//
//  ViewController.swift
//  TMDB_try
//
//  Created by Arief Ramadhan on 28/12/22.
//

import UIKit

class ViewController: UIViewController {

    private let pendingOperation = PendingOperation()
    @IBOutlet weak var MovieTableView: UITableView!
    var apiservice = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieTableView.dataSource = self
        MovieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieTableViewCell" )
        
        apiservice.getPopularMoviesData{ (result) in
            print(result)
        }
    }
    
    fileprivate func startOperations(movie: MovieFilm, indexPath: IndexPath){
        if movie.state == .new {
            startDownload(movie: movie, indexPath: indexPath)
        }
    }

    fileprivate func startDownload(movie: MovieFilm, indexPath: IndexPath){
        guard pendingOperation.downloadInprogress[indexPath] == nil else { return }
        
        let downloader = ImageDownloader(movie: movie)
        
        downloader.completionBlock = {
            if downloader.isCancelled {return}
            DispatchQueue.main.async {
                self.pendingOperation.downloadInprogress.removeValue(forKey: indexPath)
                self.MovieTableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        pendingOperation.downloadInprogress[indexPath] = downloader
        pendingOperation.downloadQueue.addOperation(downloader)
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableViewCell", for: indexPath) as? MovieTableViewCell {
            let movie = movies[indexPath.row]
            cell.movieTitle.text = movie.title
            cell.movieImage.image = movie.image
            
            if movie.state == .new {
                cell.indicatorLoading.isHidden = false
                cell.indicatorLoading.startAnimating()
                
                startOperations(movie: movie, indexPath: indexPath)
            } else {
                cell.indicatorLoading.stopAnimating()
                cell.indicatorLoading.isHidden = true
                
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    
}

