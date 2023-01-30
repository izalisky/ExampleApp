//
//  MovieDetailsViewModel.swift
//  TestApp
//
//   Created by Ihor Zaliskyj on 21.11.2022.
//

import Foundation

class MovieDetailsViewModel : MovieDetailsDelegate {
    private var movie : Movie!
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        Strings.detailScreenTitle.localized
    }
    
    var movieName: String {
        return movie.fullTitle
    }
    
    var imageUrl: URL? {
        return URL(string: movie.image)
    }
    
}
