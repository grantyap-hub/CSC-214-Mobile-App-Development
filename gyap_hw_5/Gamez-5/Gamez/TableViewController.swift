//
//   TableViewController.swift
//   Gamez
//
//  Created by: Arthur Roolfs on 6/24/20.
//  Copyright © 2020 Arthur Roolfs. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{

    var reviews: Reviews!


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        self.tableView?.rowHeight = 64
        return GenreType.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let genre = GenreType(rawValue: section) {
            return reviews.games(for: genre).count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return GenreType(rawValue: section)?.title()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? TableViewCell else {
            fatalError("Expected UITableViewCell")
        }

        if let genre = GenreType(rawValue: indexPath.section) {
            let genreGames = reviews.games(for: genre)
            let game = genreGames[indexPath.row]
            cell.TitleLabel?.text = game.title
            cell.DateLabel?.text = game.released.description
            cell.RatingImg?.image = game.getRating()
            
            
        }
        return cell
    }
}
