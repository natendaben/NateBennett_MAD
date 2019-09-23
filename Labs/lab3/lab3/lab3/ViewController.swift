//
//  ViewController.swift
//  lab3
//
//  Created by Nathanael Bennett on 9/23/19.
//  Copyright © 2019 Nathanael Bennett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var iceCreamType: UISegmentedControl!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var capitalizationSwitch: UISwitch!
    
    func changeImage(){
        if iceCreamType.selectedSegmentIndex == 0 {
            imageView.image = UIImage(named: "vanilla")
            mainLabel.text = "The Classic Flavor"
            mainLabel.textColor = UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1)
        }
        else if iceCreamType.selectedSegmentIndex == 1 {
            imageView.image = UIImage(named: "chocolate")
            mainLabel.text = "Rich, Dark and Delicious"
            mainLabel.textColor = UIColor(red: 71/255, green: 37/255, blue: 0, alpha: 1)
        }
        else if iceCreamType.selectedSegmentIndex == 2 {
            imageView.image = UIImage(named: "strawberry")
            mainLabel.text = "Great for Hot Summer Days"
            mainLabel.textColor = UIColor(red: 250/255, green: 0, blue: 50/255, alpha: 1)
        }
    }
    
    func updateCapitalization(){
        if capitalizationSwitch.isOn {
            mainLabel.text = mainLabel.text?.uppercased()
        }
        else {
            mainLabel.text = mainLabel.text?.lowercased()
        }
    }
    @IBAction func changeFlavor(_ sender: UISegmentedControl) {
        changeImage()
        updateCapitalization()
    }
    
    @IBAction func changeCapitalization(_ sender: UISwitch) {
        updateCapitalization()
    }
    
    @IBAction func fontSizeSlider(_ sender: UISlider) {
        let fontSize = sender.value //this is a float value since we are using a slider
        let fontSizeCGFloat = CGFloat(fontSize)//convert float to CGFloat type
        mainLabel.font = UIFont.systemFont(ofSize: fontSizeCGFloat) //use fontSize variable to set font size
//        if fontSize < 10{
//            fontSizeLabel.text = "Tiny"
//        }
//        else if fontSize < 14 {
//             fontSizeLabel.text = "Med"
//        }
//        else if fontSize < 18 {
//             fontSizeLabel.text = "Big"
//        }
//        else if fontSize < 22 {
//             fontSizeLabel.text = "Huge"
//        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

