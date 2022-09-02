//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Ryan Enguero on 9/1/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLbl: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    var movie : MovieData? {
        didSet {
            movieTitleLbl.text = movie?.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
