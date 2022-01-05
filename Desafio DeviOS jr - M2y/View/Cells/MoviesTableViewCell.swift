//
//  MoviesTableViewCell.swift
//  Desafio DeviOS jr - M2y
//
//  Created by Carlos Duran on 29/12/21.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieNameView: UILabel!
    @IBOutlet weak var movieYearView: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static let identifier = "MoviesTableViewCell"
    
    static func nib() -> UINib {
    return UINib(nibName: "MoviesTableViewCell", bundle: nil)
}

    func configure(with model: Movie) {
        self.movieNameView.text = model.title
        self.movieYearView.text = model.release_date
        let url = "https://image.tmdb.org/t/p/original\(model.poster_path)"
        if let data = try? Data(contentsOf: URL(string: url)!) {
           self.posterImageView.image = UIImage(data: data)
        }
    }
    
}
