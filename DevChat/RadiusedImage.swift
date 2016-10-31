//
//  RadiusedImage.swift
//  DevChat
//
//  Created by Dustin Hullett on 10/31/16.
//  Copyright © 2016 Dustin Hullett. All rights reserved.
//

import UIKit

class RadiusedImage: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.8).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5.0
        
    }
}



