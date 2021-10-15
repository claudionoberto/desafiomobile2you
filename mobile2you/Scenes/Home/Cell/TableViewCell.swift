//
//  TableViewCell.swift
//  mobile2you
//
//  Created by Claudio Noberto  on 13/10/21.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var imageViewMovieCell: UIImageView!
    @IBOutlet weak var labelTitleMovieCell: UILabel!
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelRelease: UILabel!
    // MARK: Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: Methods
    func setupMovies(_ movie: SimilarMovies?) {
        guard let urlImage = movie?.poster_path, let movieGenre = movie?.genre_ids else { return }
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(urlImage)")
        imageViewMovieCell.kf.setImage(with: url)
        labelTitleMovieCell.text = movie?.title
        labelRelease.text = movie?.release_date.formattedDate
        let genre = settingGenre(ID: movieGenre[0])
        labelGenre.text = genre
    }
    
    func settingGenre(ID: Int) -> String {
        switch ID {
        case 28:
            return "Action"
        case 12:
            return "Adventure"
        case 16:
            return "Animation"
        case 35:
            return "Comedy"
        case 80:
            return "Crime"
        case 99:
            return "Documentary"
        case 18:
            return "Drama"
        case 10751:
            return "Family"
        case 14:
            return "Fantasy"
        case 36:
            return "History"
        case 27:
            return "Horror"
        case 10402:
            return "Music"
        case 9648:
            return "Mystery"
        case 10749:
            return "Romance"
        case 878:
            return "Science Fiction"
        case 10770:
            return "TV Movie"
        case 53:
            return "Thriller"
        case 10752:
            return "War"
        default:
            return "Western"
        }
    }
    
}

extension String {
    var formattedDate: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "yyyy"
            return dateFormatter.string(from: date)
        }
        return nil
    }
}
