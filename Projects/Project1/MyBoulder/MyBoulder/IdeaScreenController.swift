//
//  IdeaScreenController.swift
//  MyBoulder
//
//  Created by Nathanael Bennett on 10/7/19.
//  Copyright © 2019 Nathanael Bennett. All rights reserved.
//

import UIKit

class IdeaScreenController: UIViewController {
    @IBOutlet weak var ideaTitle: UILabel!
    @IBOutlet weak var ideaPic: UIImageView!
    @IBOutlet weak var ideaDescription: UILabel!
    @IBOutlet weak var ideaAddress: UILabel!
    
    var generatedIdea : Idea = Idea()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ideaTitle.text = generatedIdea.title
        ideaPic.image = UIImage(named: generatedIdea.imageName)
        ideaDescription.text = generatedIdea.description
        ideaAddress.text = generatedIdea.address
        // Do any additional setup after loading the view.
    }
}
