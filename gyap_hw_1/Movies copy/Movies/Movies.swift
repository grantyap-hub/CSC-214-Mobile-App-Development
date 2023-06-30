//
//  Movies.swift
//  Movies
//
//  Created by Grant Yap on 9/5/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import Foundation

class Movies{
    
    private var movieIndex = 0
    private let movieDictionary = ["Anthony Hopkins": "The Silence of the Lambs",
                                   "Jack Nicholson": "Chinatown",
                                   "Marlon Brando": "Apocalypse Now",
                                   "Daniel Day-Lewis": "There Will Be Blood",
                                   "Al Pacino": "Serpico",
                                   "Robert De Niro": "Raging Bull",
                                   "Dustin Hoffman": "Tootsie"]
    
    func getMovie() -> String {
        let movies = movieDictionary.values.sorted()
        movieIndex += 1
        if movieIndex == movies.count {
            movieIndex = 0
        }
        return movies[movieIndex]
    }
}
