//
//  ViewController.swift
//  frogs
//  Lab 1 for Mobile Application Development
//  Created by Nathanael Bennett on 9/3/19.
//  Copyright © 2019 Nathanael Bennett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func wetFrog(_ sender: UIButton) {
        //change the photo based on which button is pushed
        if sender.tag == 1{
            froggoPic.image = UIImage(named: "frog3")
            bottomText.text = "This froggo is definitely wet. He looks alright with it though, being a frog."
        }
        else if sender.tag == 2{
            froggoPic.image = UIImage(named: "frog2")
            bottomText.text = "This froggo probably lives in a jungle somewhere. Who knows what he's looking at? Could be flies."
        }
        else if sender.tag == 3{
            froggoPic.image = UIImage(named: "frog")
            bottomText.text = "This froggo is really happy. Other than that, he's your average variety of frog."
        }
    }
    
    @IBOutlet weak var froggoPic: UIImageView!
    @IBOutlet weak var bottomText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

