//
//  MoviesListDelegate.swift
//  TestApp
//
//  Created by Ihor Zaliskyj on 21.11.2022.
//

import Foundation


protocol MoviesListDelegate {
    var title: String {get}
    var numberOfRows : Int {get}
    var allMoviesTitles: [String] {get}
    func loadMoviesList(_ completion: @escaping (Error?) -> Void)
    func movie(for row:Int)->Movie
    func filterMovies(_ searchText: String)
}
