//
//  SignInButton.swift
//  DevChat
//
//  Created by Dustin Hullett on 11/6/16.
//  Copyright © 2016 Dustin Hullett. All rights reserved.
//

import UIKit

class SignInButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.8).cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        layer.cornerRadius = 5.0
    }
    
}
