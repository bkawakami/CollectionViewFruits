//
//  RoundedCornersView.swift
//  RWDevCon
//
//  Created by Mic Pringle on 26/02/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

@IBDesignable
class CardsView: UICollectionViewCell {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var masksToBounds: Bool = false {
        didSet {
            self.layer.masksToBounds = masksToBounds
        }
    }
    
    @IBInspectable var border: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = border
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.blackColor() {
        didSet {
            self.layer.shadowColor = shadowColor.CGColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0,height: 0) {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
}
