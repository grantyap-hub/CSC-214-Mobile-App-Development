//
//  ModelClass.swift
//  Project 1
//
//  Created by Grant Yap on 9/27/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import Foundation
import UIKit

class AcornGuesser {
    
    var secretLocation = CGPoint.zero
    var gameOver = true
    var score = 0
    var close = ""
    
    func startGame(with gameRect: CGRect, acornSize: CGSize){
        secretLocation = CGPoint(x: randomCGFloat(for: gameRect.width - acornSize.width),
                                 y: randomCGFloat(for: gameRect.height - acornSize.height))
        secretLocation = secretLocation.offset(dx: acornSize.width / 2, dy: acornSize.height / 2)
        gameOver = false
        score = 0
    }
    
    func tryLocation(_ point: CGPoint) -> (Bool, Int, UIColor, String) {
        let dist = distance(between: point, and: secretLocation)
        gameOver = dist <= 50.0
        score += 1
        return (gameOver, score, colorForDistance(dist), closenessForDistance(dist))

    }
    
    
    func randomCGFloat(for upperBound: CGFloat) -> CGFloat {
        return CGFloat(arc4random_uniform(UInt32(upperBound)))
    }
    
    func distance(between pointA: CGPoint, and pointB: CGPoint) -> CGFloat {
        let x = pow(Double(pointB.x - pointA.x), 2)
        let y = pow(Double(pointB.y - pointA.y), 2)
        return CGFloat((x + y).squareRoot())
    }
    
    func colorForDistance(_ distance: CGFloat) -> UIColor {
        switch distance {
        case 0..<50:
            return UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        case 50..<100:
            return UIColor(red: 0.0, green: 0.8, blue: 0.2, alpha: 1.0)
        case 100..<150:
            return UIColor(red: 0.0, green: 0.8, blue: 0.4, alpha: 1.0)
        case 150..<200:
            return UIColor(red: 0.0, green: 0.4, blue: 0.6, alpha: 1.0)
        case 200..<250:
            return UIColor(red: 0.0, green: 0.2, blue: 0.8, alpha: 1.0)
        default: return UIColor.blue
        }
    }
    
    func closenessForDistance(_ distance: CGFloat) -> String {
        switch distance {
               case 0..<50:
                   return NSLocalizedString("You got it! Good Job!", comment: "")
               case 50..<100:
                   return NSLocalizedString("Almost there!", comment: "")
               case 100..<150:
                   return NSLocalizedString("About Half Way", comment: "")
               case 150..<200:
                   return NSLocalizedString("Not Very Close", comment: "")
               case 200..<250:
                   return NSLocalizedString("Just Keep Trying!", comment: "")
               default: return NSLocalizedString("Keep on tapping!", comment: "")
               }
    }
    
}


extension CGPoint {
    mutating func offset(dx: CGFloat, dy: CGFloat) -> CGPoint {
        x += dx
        y += dy
        return self
    }
}
