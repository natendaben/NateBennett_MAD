//
//  ViewController.swift
//  lab4
//
//  Created by Nathanael Bennett on 10/1/19.
//  Copyright © 2019 Nathanael Bennett. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Outlets
    @IBOutlet weak var pizzaCostField: UITextField!
    @IBOutlet weak var peoplePerPizzaField: UITextField!
    

    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var numberPizzasToBuy: UILabel!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var costPerPerson: UILabel!
    
    //Actions
    @IBAction func updatePeople(_ sender: UIStepper) {
        if peopleStepper.value == 1 {
            numberOfPeopleLabel.text = "1 person"
        }
        else{
            numberOfPeopleLabel.text = String(format: "%.0f", peopleStepper.value) + " people"
        }
        calculateStuff()
    }//update label for number of people
    
    //Functions
    func calculateStuff(){
        //Get initial values
        let pizzaCost : Float
        if pizzaCostField.text!.isEmpty {
            pizzaCost = 0.0
        } else {
            pizzaCost = Float(pizzaCostField.text!)!
        }
        let numberOfPeoplePerPizza : Float
        if peoplePerPizzaField.text!.isEmpty {
            numberOfPeoplePerPizza = 0.0
        } else {
            numberOfPeoplePerPizza = Float(peoplePerPizzaField.text!)!
        }
        let numberOfPeople = Float(peopleStepper.value)
        if numberOfPeople > 0 && numberOfPeoplePerPizza > 0 {
            //calculate number of pizzas to buy
            var numberOfPizzasToBuy : Float
            let rawNumberOfPizzas : Float = numberOfPeople/numberOfPeoplePerPizza
            let pizzaRemainder : Float = numberOfPeople.truncatingRemainder(dividingBy: numberOfPeoplePerPizza)
            if pizzaRemainder == 0.0 {
                numberOfPizzasToBuy = rawNumberOfPizzas
            } else {
                numberOfPizzasToBuy = rawNumberOfPizzas.rounded(.towardZero) + 1
            }
            if(numberOfPizzasToBuy == 1.0){
                numberPizzasToBuy.text = "1 pizza"
            } else {
                numberPizzasToBuy.text = String(format: "%.0f", numberOfPizzasToBuy) + " pizzas"
            }
            
            //calculate cost
            let currencyFormatter = NumberFormatter()
            currencyFormatter.numberStyle = NumberFormatter.Style.currency
            let totalPizzaCost = numberOfPizzasToBuy*pizzaCost
            totalCost.text = currencyFormatter.string(from: NSNumber(value: totalPizzaCost))
            let pizzaPricePerPerson = totalPizzaCost/numberOfPeople
            costPerPerson.text = currencyFormatter.string(from: NSNumber(value: pizzaPricePerPerson))
            
        } else if numberOfPeople == 0.0 {
            let alert = UIAlertController(title: "Warning", message: "The number of people must be greater than 0", preferredStyle: UIAlertController.Style.alert)
//            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
//            alert.addAction(cancelAction)
            let okAction = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: {action in
                    self.peopleStepper.value = 1
                    self.numberOfPeopleLabel.text? = "1 person"
                    self.calculateStuff()
                })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        calculateStuff()
    }
    override func viewDidLoad() {
        pizzaCostField.delegate = self
        peoplePerPizzaField.delegate = self
        
        //The below functions from the book were actually causing problems, moving the text fields being edited out of view
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil) //defines view as observer to receive the keyboardWillShowNotification, will then call function keyboardWillShow
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil) //defines view as observer to receive the keyboardWillHideNotification, will then call function keyboardWillHide
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)) //allows view to detect tap gestures and call dismissKeyboard function upon tap
        view.addGestureRecognizer(tap)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true) //this sends the keyboardWillHideNotification to the view, and runs whenever the user taps somewhere outside of the text field
    }
    /* The below functions from the book were causing unexpected problems by adjusting for the size of the keyboard
    @objc func keyboardWillShow(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }//This function defines the size of the keyboard view based on the size of the iOS screen, then uses height of the keyboard to figure out how far to slide the view and UI objects up to make room for virtual keyboard
   
    @objc func keyboardWillHide(notification: NSNotification){
        if((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }//This function checks if the virtual keyboard is visible. If so, it moves the view back down to cover the keyboard. Otherwise it does nothing
*/

}

