//
//   Reviews.swift
//   Gamez
//
//  Created by: Arthur Roolfs on 6/24/20.
//  Copyright © 2020 Arthur Roolfs. All rights reserved.
//

import Foundation

class Reviews {
    
    var games = [Game]()
    
    func addGame(title: String, genre: String, released: Int, rating:Int) {
        games.append(Game(title: title, genre: GenreType.init(genre), released: released, rating: rating))
    }
    
    func games(for genreType: GenreType) -> [Game] {
        return games.filter { $0.genre == genreType }
    }
}
