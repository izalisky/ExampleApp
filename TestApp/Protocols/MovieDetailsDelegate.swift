//
//  MovieDetailsDelegate.swift
//  TestApp
//
//   Created by Ihor Zaliskyj on 21.11.2022.
//

import Foundation

protocol MovieDetailsDelegate {
    var title : String {get}
    var movieName: String {get}
    var imageUrl: URL? {get}
}
