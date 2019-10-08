//
//  ViewController.swift
//  MyBoulder
//
//  Created by Nathanael Bennett on 10/7/19.
//  Copyright © 2019 Nathanael Bennett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //OUTLETS
    @IBOutlet weak var outdoorExplorationSwitch: UISwitch!
    @IBOutlet weak var entertainmentSwitch: UISwitch!
    @IBOutlet weak var urbanAttractionsSwitch: UISwitch!
    @IBOutlet weak var moneySegmentControl: UISegmentedControl!
    @IBOutlet weak var seasonSegmentControl: UISegmentedControl!
    
    let testIdea = Idea()
    
    @IBAction func generateIdea(_ sender: CustomButton) {
        print("let's go!")
        if outdoorExplorationSwitch.isOn{
            print("you like nature")
        }
        if entertainmentSwitch.isOn{
            print("you like entertainment")
        }
        if urbanAttractionsSwitch.isOn{
            print("you like urban areas")
        }
        if moneySegmentControl.selectedSegmentIndex == 1 {
            print("you are rich")
        } else{
            print("you are college student")
        }
        if seasonSegmentControl.selectedSegmentIndex == 0{
            print("you like flowers")
        }else if seasonSegmentControl.selectedSegmentIndex == 1{
            print("you like warm weather")
        }else if seasonSegmentControl.selectedSegmentIndex == 2{
            print("you like leaves")
        }else if seasonSegmentControl.selectedSegmentIndex == 3{
            print("you like snow")
        }
        

        testIdea.title = "Take a Tour of Avery Brewing Company"
        testIdea.description = "Avery Brewing Company is a famed craft brewery just northeast of Boulder with excellent food and beer. Join a free tour to taste some samples and learn about the brewing process!"
        testIdea.imageName = "avery"
        testIdea.address = "4910 Nautilus Ct, Boulder, CO 80301"
        
//        let ideaView = IdeaScreenController(nibName: "IdeaScreenController", bundle: nil)
//        ideaView.generatedIdea = testIdea
//        navigationController?.pushViewController(ideaView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(true, animated: true) //hide nav bar on the first view
//        super.viewWillAppear(true)
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(false, animated: true) //show nav bar on second view
//        super.viewWillDisappear(true)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "buttonTapped" { //make sure this is the right segue
            let newView = segue.destination as? IdeaScreenController //cast UIViewController to IdeaScreenController to access property generatedIdea
            newView?.generatedIdea = testIdea //set generatedIdea Idea to be the one selected here
        }
    }

}

