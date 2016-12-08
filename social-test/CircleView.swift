//
//  CircleView.swift
//  social-test
//
//  Created by Fabio Quintanilha on 12/8/16.
//  Copyright © 2016 Studio. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func layoutSubviews() {
            super.layoutSubviews()
            layer.cornerRadius = self.frame.width / 2
            clipsToBounds = true
    }
}
