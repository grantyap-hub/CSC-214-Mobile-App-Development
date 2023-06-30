//
//  CornerColors.swift
//  CornerColors
//
//  Created by Grant Yap on 9/12/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import Foundation
import UIKit

class CornerColors {
    private static let colorsArray = [UIColor.black,
                                      UIColor.green,
                                      UIColor.blue,
                                      UIColor.red]
    
    var firstColor = ColorManager(labels: colorsArray, index: 0)
    
    func getColor() -> UIColor {
        return firstColor.getNextColor()
    }
    
}
