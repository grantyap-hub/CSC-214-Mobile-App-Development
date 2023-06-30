//
//   Game.swift
//   Gamez
//
//  Created by: Arthur Roolfs on 6/24/20.
//  Copyright © 2020 Arthur Roolfs. All rights reserved.
//
import UIKit
import Foundation

class Game {
    
    var title: String
    var genre: GenreType
    var released: Int
    var rating: Int
    
    init(title: String, genre: GenreType, released: Int, rating: Int) {
        
        self.title = title
        self.genre = genre
        self.released = released
        self.rating = rating
    }
    
    convenience init(title: String, genre: GenreType, released: Int) {
        self.init(title: title, genre: genre, released: released, rating: 0)
    }
    
    func getRating() -> UIImage {
        switch (rating){
        case 1: return UIImage(named: "stars_01")!
        case 2: return UIImage(named: "stars_02")!
        case 3: return UIImage(named: "stars_03")!
        default: return UIImage(named: "stars_01")!
        
    }
}
}
