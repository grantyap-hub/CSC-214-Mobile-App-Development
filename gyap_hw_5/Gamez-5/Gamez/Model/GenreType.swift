//
//  GenreType.swift
//  Gamez
//
//  Created by Arthur Roolfs on 7/28/19.
//  Copyright © Arthur Roolfs. All rights reserved.
//

import Foundation

enum GenreType: Int, CaseIterable {
    
    case actionRPG, firstPersonShooter, jrpg, platformer, sideScroller, shooter, teamShooter, towerDefense, westernRPG, unknown
    
    func title() -> String {
        switch self {
            case .actionRPG:                    return "Action RPG"
            case .firstPersonShooter:           return "First Person Shooter"
            case .jrpg:                         return "JRPG"
            case .platformer:                   return "Platformer"
            case .sideScroller:                 return "Side Scroller"
            case .shooter:                      return "Shooter"
            case .teamShooter:                  return "Team Shooter"
            case .towerDefense:                 return "Tower Defense"
            case .westernRPG:                   return "Western RPG"
            case .unknown:                      return "Unknown"
        }
    }
    
    init(_ title: String) {
        switch title {
            case "Action RPG": self = .actionRPG
            case "First Person Shooter": self = .firstPersonShooter
            case "JRPG": self = .jrpg
            case "Platformer": self = .platformer
            case "Side Scroller": self = .sideScroller
            case "Shooter": self = .shooter
            case "Team Shooter": self = .teamShooter
            case "Tower Defense": self = .towerDefense
            case "Western RPG": self = .westernRPG
            default: self = .unknown
        }
    }
}
