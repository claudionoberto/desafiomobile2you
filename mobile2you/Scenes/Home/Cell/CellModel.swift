//
//  CellModel.swift
//  mobile2you
//
//  Created by Claudio Noberto  on 14/10/21.
//

import Foundation
import Alamofire

class CellModel {
    private var SimilarMovie: [SimilarMovies] = []
    var updateCell: (() -> Void)?
    
    func getMovieCount() -> Int {
        return SimilarMovie.count
    }
    
    func movieIndex(_ index: Int) -> SimilarMovies {
        return SimilarMovie[index]
    }
    
    func apiSimilarMovies() {
        AF.request("https://api.themoviedb.org/3/movie/619778/similar?api_key=4c41b614a9c0abc1f599988050310ee7", method: .get).responseJSON { (response) in
            guard let data = response.data else {return}
            
            do{
                let movies = try JSONDecoder().decode(Movies.self, from: data)
                self.SimilarMovie = movies.results
                self.updateCell?()
            }catch{
                
            }
        }
    }
}
