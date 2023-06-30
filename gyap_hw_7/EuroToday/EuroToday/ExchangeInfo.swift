//
//  ExchangeInfo.swift
//  EuroToday
//
//  Created by Grant Yap on 11/22/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import Foundation


struct ExchangeInfo: Decodable {
    var base: String?
    var date: String?
    var rates: [String:Double]?
}
