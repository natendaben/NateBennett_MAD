//
//  Scene2ViewController.swift
//  lab5
//
//  Created by Nathanael Bennett on 10/18/19.
//  Copyright © 2019 Nathanael Bennett. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var hometownField: UITextField!
    @IBOutlet weak var relationshipField: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func viewDidLoad() {
        nameField.delegate = self
        emailField.delegate = self
        hometownField.delegate = self
        relationshipField.delegate = self
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneWithInfo" {
            let firstController = segue.destination as! ViewController
            if nameField.text!.isEmpty == false{
                firstController.primaryUser.name = nameField.text
            }
            if emailField.text!.isEmpty == false{
                firstController.primaryUser.email = emailField.text
            }
            if hometownField.text!.isEmpty == false{
                firstController.primaryUser.hometown = hometownField.text
            }
            if relationshipField.text!.isEmpty == false{
                firstController.primaryUser.relationshipStatus = relationshipField.text
            }
        }
    }
}
