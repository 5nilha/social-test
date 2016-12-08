//
//  PostButton.swift
//  social-test
//
//  Created by Fabio Quintanilha on 12/8/16.
//  Copyright © 2016 Studio. All rights reserved.
//

import UIKit

class PostButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageView?.contentMode = .scaleAspectFit
        // to put a button with corners
        //layer.cornerRadius = 15.0
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2.5
    }
    

}
