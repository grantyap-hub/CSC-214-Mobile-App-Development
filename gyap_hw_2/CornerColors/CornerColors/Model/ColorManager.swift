//
//  ColorManager.swift
//  CornerColors
//
//  Created by Grant Yap on 9/12/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import Foundation
import UIKit

struct ColorManager {
    let labels: [UIColor]
    var index: Int
    
    mutating func getNextColor() -> UIColor {
        if index == labels.count {
            index = 0
        }
        
        let value = labels[index]
        index += 1
        
        return value
    }
}
