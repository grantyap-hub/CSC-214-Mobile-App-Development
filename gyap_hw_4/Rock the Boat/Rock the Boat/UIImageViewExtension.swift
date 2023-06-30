//
//  UIImageViewExtension.swift
//  Rock the Boat
//
//  Created by Grant Yap on 10/11/20.
//  Copyright © 2020 Grant Yap. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func rotate(by radians: Double, with relativeAnchorPt: CGPoint) {
        
        var transform = CGAffineTransform.identity
        let anchorPt = CGPoint(x: self.bounds.size.width * relativeAnchorPt.x,
                               y: self.bounds.size.height * relativeAnchorPt.y)
        
        transform = transform.translatedBy(x: anchorPt.x, y: anchorPt.y)
        transform = transform.rotated(by: CGFloat(radians))
        transform = transform.translatedBy(x: -anchorPt.x, y: -anchorPt.y)
        self.transform = transform
    }
}

