//
//  DetailsMovieViewModel.swift
//  Movies app
//
//  Created by ZhZinekenov on 26.07.2023.
//

import Foundation

class DetailsMovieViewModel {
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieDescription: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        self.movieID = movie.id
        self.movieTitle = movie.title
        self.movieDescription = movie.overview
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
    private func makeImageURL(_ imagePath: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imagePath)")
    }
}
