//
//  MovieCellViewModel.swift
//  Movies app
//
//  Created by ZhZinekenov on 24.07.2023.
//

import Foundation
import UIKit

class MovieCellViewModel {
    var id: Int
    var title: String
    var rating: String
    var date: String
    var imageURL: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.rating = "\(movie.voteAverage)/10"
        self.date = movie.releaseDate
        self.imageURL = makeImageURL(movie.posterPath ?? "")
    }
    
    private func makeImageURL(_ imagePath: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imagePath)")
    }
    
}
