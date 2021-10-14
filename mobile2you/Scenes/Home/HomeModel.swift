//
//  HomeModel.swift
//  mobile2you
//
//  Created by Claudio Noberto  on 14/10/21.
//

import Foundation
import Alamofire

class HomeModel {
    private var MoviePoster: MovieModel?
    var updatePoster: (() -> Void)?
    
    func getPopular() -> Double? {
        return MoviePoster?.popularity
    }
    
    func getLikes() -> Int? {
        return MoviePoster?.vote_count
    }
    
    func getImage() -> String? {
        return MoviePoster?.poster_path
    }
    
    func getTitle() -> String? {
        return MoviePoster?.original_title
    }
    
    func apiPoster() {
        AF.request("https://api.themoviedb.org/3/movie/619778?api_key=4c41b614a9c0abc1f599988050310ee7", method: .get).responseJSON { (response) in
            guard let data = response.data else { return }
            
            do{
                let movie = try? JSONDecoder().decode(MovieModel.self, from: data)
                self.MoviePoster = movie
                self.updatePoster?()
            }
        }
    }
}
