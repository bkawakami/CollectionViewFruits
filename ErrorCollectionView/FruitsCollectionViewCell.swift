//
//  AnnotatedPhotoCell.swift
//  RWDevCon
//
//  Created by Mic Pringle on 26/02/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

@IBDesignable
class FruitsCollectionViewCell: CardsView {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private weak var captionLabel: UILabel!
    
    var fruits: FruitsObject? {
        didSet {
            if let fruits = fruits {
                Alamofire.request(.GET, (fruits.image)!)
                    .responseImage { response in
                        if let image = response.result.value {
                            self.imageView.image = image
                        }
                }
                self.captionLabel.text = fruits.name
            }
        }
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        if let attributes = layoutAttributes as? CardsLayoutAttributes {
            imageViewHeightLayoutConstraint.constant = attributes.photoHeight
        }
    }
    
}
