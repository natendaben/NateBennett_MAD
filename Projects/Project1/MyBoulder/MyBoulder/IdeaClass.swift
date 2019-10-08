//
//  IdeaClass.swift
//  MyBoulder
//
//  Created by Nathanael Bennett on 10/7/19.
//  Copyright © 2019 Nathanael Bennett. All rights reserved.
//

import Foundation

class Idea {
    var title : String = "" //name of activity
    var imageName : String = "" //name of image for activity
    var description : String = "" //short description
    var address : String = "" //address of activity location
    var category : String = "" //can be "outdoors", "urban", or "entertainment"
    var summer : Bool = false
    var fall : Bool = false
    var spring : Bool = false
    var winter : Bool = false
    var paid : Bool = false
}
