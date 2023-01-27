//
//  ViewController.swift
//  TMDB_try
//
//  Created by Arief Ramadhan on 28/12/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var MovieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieTableView.dataSource = self
        MovieTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieTableViewCell" )
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
                startDownload(movie: movie, indexPath: indexPath)
            } else {
                cell.indicatorLoading.stopAnimating()
                cell.indicatorLoading.isHidden = true
                
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    fileprivate func startDownload(movie: Movie, indexPath: IndexPath) {
        let imageDownloader = ImageDownloader()
        if movie.state == .new {
          Task {
            do {
              let image = try await imageDownloader.downloadImage(url: movie.poster)
              movie.state = .downloaded
              movie.image = image
              self.MovieTableView.reloadRows(at: [indexPath], with: .automatic)
            } catch {
              movie.state = .failed
              movie.image = nil
            }
          }
        }
      }
    
}

