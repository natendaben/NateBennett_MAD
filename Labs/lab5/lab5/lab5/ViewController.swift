//
//  ViewController.swift
//  lab5
//
//  Created by Nathanael Bennett on 10/18/19.
//  Copyright © 2019 Nathanael Bennett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var primaryUser = User()
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var relationshipLabel: UILabel!
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        nameLabel.text = primaryUser.name
        emailLabel.text = primaryUser.email
        hometownLabel.text = primaryUser.hometown
        relationshipLabel.text = primaryUser.relationshipStatus
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

