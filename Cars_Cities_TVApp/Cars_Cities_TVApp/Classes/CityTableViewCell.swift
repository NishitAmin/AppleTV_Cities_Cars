//
//  CityTableViewCell.swift
//  Cars_Cities_TVApp
//
//  Created by Xcode on 2020-12-11.
//  Copyright © 2020 Nishit Amin. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet var lblCar : UILabel!
    @IBOutlet var imgCar : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
