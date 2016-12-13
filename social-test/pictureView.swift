//
//  pictureView.swift
//  social-test
//
//  Created by Fabio Quintanilha on 12/10/16.
//  Copyright © 2016 Studio. All rights reserved.
//

import UIKit

class pictureView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 12.0
    }

}
