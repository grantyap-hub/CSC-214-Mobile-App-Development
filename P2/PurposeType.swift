//
//  PurposeType.swift
//  P2
//
//  Created by Grant Yap on 10/25/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import Foundation
import UIKit


enum PurposeType: Int, CaseIterable {
    case errand, visit, exercise
    
    func title() -> String {
        switch self {
        case .errand:
            return NSLocalizedString("Errand", comment: "")
        case .visit:
            return NSLocalizedString("Visit", comment: "")
        case .exercise:
            return NSLocalizedString("Exercise", comment: "")
        }
    }
    
    func image() -> UIImage? {
        switch self{
        case .errand:
            return UIImage(named: "type_errand")
        case .visit:
            return UIImage(named: "type_visit")
        case .exercise:
            return UIImage(named: "type_exercise")
        }
    }
}
