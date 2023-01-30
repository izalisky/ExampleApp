//
//  CharacterInTitleViewModel.swift
//  TestApp
//
//   Created by Ihor Zaliskyj on 21.11.2022.
//

import Foundation

class CharacterInTitleViewModel: CharacterInTitleDelegate {
    var movieTitles : [String]!
    
    var title: String {
        Strings.infoScreenTitle.localized
    }
    
    init(movieTitles: [String]) {
        self.movieTitles = movieTitles
    }
    
    var infoText: String {
        allCharacters.map{ "\"\($0)\" : \(countOfCharacter($0))"}.joined(separator: "\n")
    }
    
    var allCharacters : [Character] {
        var set = Set<Character>()
        movieTitles.joined().forEach{ set.insert($0) }
        return set.sorted()
    }
    
    func countOfCharacter(_ character: Character) -> Int {
        return movieTitles.joined().filter{ $0 == character }.count
    }
    
    
}
