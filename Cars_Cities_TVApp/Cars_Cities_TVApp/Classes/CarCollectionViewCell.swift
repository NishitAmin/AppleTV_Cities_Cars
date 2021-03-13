//
//  CarCollectionViewCell.swift
//  Cars_Cities_TVApp
//
//  Created by Xcode on 2020-12-11.
//  Copyright © 2020 Nishit Amin. All rights reserved.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var featuredImage : UIImageView!
    @IBOutlet var lblCar : UILabel!
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        if(self.isFocused){
            self.featuredImage.adjustsImageWhenAncestorFocused = true
        }else{
            self.featuredImage.adjustsImageWhenAncestorFocused = false
        }
    }
    
}
