//
//  MovieTableViewCell.swift
//  TMDB_try
//
//  Created by Arief Ramadhan on 02/01/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var indicatorLoading: UIActivityIndicatorView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
