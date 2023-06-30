//
//  Utils.swift
//  EuroToday
//
//  Created by Grant Yap on 11/22/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import Foundation

enum URLError: Error {
    case BadURL
    case NotImplementedYet
}

let session: URLSession = {
    return URLSession(configuration: URLSessionConfiguration.default)
}()

extension NumberFormatter {
    
    func currency(with price: Double, code: String) -> String {
        usesGroupingSeparator = true
        numberStyle = .currency
        currencyCode = code
        return string(from: NSNumber(value: price)) ?? ""
    }
}

