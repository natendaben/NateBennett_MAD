//
//  ViewController.swift
//  iOS midterm
//
//  Created by Nathanael Bennett on 10/15/19.
//  Copyright © 2019 Nathanael Bennett. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var milesTextBox: UITextField!
    @IBOutlet weak var monthlySwitch: UISwitch!
    @IBOutlet weak var gallonLabel: UILabel!
    @IBOutlet weak var transportSegment: UISegmentedControl!
    @IBOutlet weak var gasStepper: UIStepper!
    @IBOutlet weak var transportImage: UIImageView!
    
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var gasPurchaseLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBAction func updateStepper(_ sender: UIStepper) {
        if gasStepper.value == 1 {
            gallonLabel.text = "1 gallon"
        }
        else{
            gallonLabel.text = String(format: "%.0f", gasStepper.value) + " gallons"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        calculateStuff()
    }
    @IBAction func buttonPushed(_ sender: UIButton) {
        calculateStuff()
    }
    @IBAction func switchChanged(_ sender: UISwitch) {
        calculateStuff()
    }
    @IBAction func segmentControlChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            transportImage.image = UIImage(named: "car_icon")
        } else if sender.selectedSegmentIndex == 1{
            transportImage.image = UIImage(named: "bus_icon")
        } else if sender.selectedSegmentIndex == 2{
            transportImage.image = UIImage(named: "bike_icon")
        }
        calculateStuff()
    }
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        
    }
    
    func calculateStuff(){
        let numberOfMiles : Float
        if milesTextBox.text!.isEmpty {
            numberOfMiles = 0.0
        } else {
            numberOfMiles = Float(milesTextBox.text!)!
        }
        var totalCommuteTime : Float
        let gasToPurchase : Float
        if numberOfMiles != 0.0 {
            if monthlySwitch.isOn{
                if transportSegment.selectedSegmentIndex == 0 {
                    totalCommuteTime = numberOfMiles //same as numberOfMiles/20*20 (multiplied by 20 for 20 work days/month
                    totalTimeLabel.text = String(format: "%.2f", totalCommuteTime) + " hr"
                    gasToPurchase = numberOfMiles/24*20
                    gasPurchaseLabel.text = String(format: "%.2f", gasToPurchase) + " gallons"
                } else if transportSegment.selectedSegmentIndex == 1 { //bus
                    totalCommuteTime = (numberOfMiles/12 + 1/12)*20
                    totalTimeLabel.text = String(format: "%.2f", totalCommuteTime) + " hr"
                    gasPurchaseLabel.text = "0.0 gallons"
                }
                 else if transportSegment.selectedSegmentIndex == 2 { //bike
                    totalCommuteTime = numberOfMiles/10*20
                    totalTimeLabel.text = String(format: "%.2f", totalCommuteTime) + " hr"
                    gasPurchaseLabel.text = "0.0 gallons"
                }
                
            } else {
                if transportSegment.selectedSegmentIndex == 0 { //car
                    totalCommuteTime = numberOfMiles/20
                    totalTimeLabel.text = String(format: "%.2f", totalCommuteTime) + " hr"
                    gasToPurchase = numberOfMiles/24
                    gasPurchaseLabel.text = String(format: "%.2f", gasToPurchase) + " gallons"
                }
                if transportSegment.selectedSegmentIndex == 1 { //bus
                    totalCommuteTime = numberOfMiles/12 + 1/12
                    totalTimeLabel.text = String(format: "%.2f", totalCommuteTime) + " hr"
                    gasPurchaseLabel.text = "0.0 gallons"
                }
                if transportSegment.selectedSegmentIndex == 2 { //bike
                    totalCommuteTime = numberOfMiles/10
                    totalTimeLabel.text = String(format: "%.2f", totalCommuteTime) + " hr"
                    gasPurchaseLabel.text = "0.0 gallons"
                }
            }
        }
        if numberOfMiles > 50 {
            let alert = UIAlertController(title: "Warning", message: "Your commute is over 50 miles!", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        milesTextBox.delegate = self

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)) //allows view to detect tap gestures and call dismissKeyboard function upon tap
        view.addGestureRecognizer(tap)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true) //this sends the keyboardWillHideNotification to the view, and runs whenever the user taps somewhere outside of the text field
    }
    
    


}

