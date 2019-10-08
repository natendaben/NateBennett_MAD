//
//  customButton.swift
//  MyBoulder
//
//  Created by Nathanael Bennett on 10/7/19.
//  Copyright © 2019 Nathanael Bennett. All rights reserved.
//

import Foundation
import UIKit

//  The below code for creating a custom button was adapted from the following video by César Pinto Castillo: youtube.com/watch?v=zatzD2z5IMg
class CustomButton: UIButton{ //create custom button class that inherits from UIButton
    override func awakeFromNib() { //function to perform some additional initialization properties
        super.awakeFromNib() //include parent class function
        layer.borderWidth = 1/UIScreen.main.nativeScale //makes the border exactly 1 pixel
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8) //some padding for the button
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2 //make the corners of the button be nice and smooth, with radius of half the button height
        layer.borderColor = tintColor.cgColor //make the border color the same color as the button's color
    }
}
