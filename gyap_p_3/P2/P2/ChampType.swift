//
//  PurposeType.swift
//  P2
//
//  Created by Grant Yap on 10/25/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import Foundation
import UIKit


enum ChampType: Int, CaseIterable {
    case velkoz, tristana, aatrox
    
    func title() -> String {
        switch self {
        case .velkoz:
            return NSLocalizedString("Vel'koz", comment: "")
        case .tristana:
            return NSLocalizedString("Tristana", comment: "")
        case .aatrox:
            return NSLocalizedString("Aatrox", comment: "")
        }
    }
    
    func image() -> UIImage? {
        switch self{
        case .velkoz:
            return UIImage(named: "vel")
        case .tristana:
            return UIImage(named: "trist")
        case .aatrox:
            return UIImage(named: "aatrox")
        }
    }
}
