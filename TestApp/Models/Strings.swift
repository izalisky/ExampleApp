//
//  Strings.swift
//  TestApp
//
//  Created by Ihor Zaliskyj on 21.11.2022.
//

import Foundation

enum Strings : String {
    
    case listScreenTitle = "Top 250 movies"
    case detailScreenTitle = "Movie Details"
    case pullToRefreshTitle = "Pull to refresh"
    case errorTitle = "Error"
    case searchBarPlaceholder = "Search Movie"
    case infoScreenTitle = "Characters In Titles"
    
    
    var localized: String {
        return NSLocalizedString(rawValue, comment: "")
    }
}
