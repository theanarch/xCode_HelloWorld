//
//  ViewController.swift
//  Hello World
//
//  Created by Boris Torbica on 2017-05-02.
//  Copyright © 2017 Boris Torbica. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate { //UITextFieldDelegate säger att klassen blir ett Delegat

    //MARK: Propertiess
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegeringsobjektet(nameTextField) skickar information till delegatet(aktuell klass)
        nameTextField.delegate = self
    }
    
    //MARK: Action
    @IBAction func doneButton(_ sender: UIButton) {
        mealNameLabel.text = nameTextField.text
        self.view.endEditing(true) //explained at bottom
    }
    
    //MARK: UITextFieldDelegate
    //Func: action of pressing Return button. 
    // This case: ending first responder status when pressing Return key => hiding keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true //spelar än så länge inte roll att det står true/false
    }
    
    //Func: is called when it is asked to resign first responder status.
    // This case: takes the information and stores it in mealNameLabel
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = nameTextField.text
    }
    
    //       self.view.endEditing(true)
    //      someTextField.resignFirstResponder()
    // Difference: the latter one is meant for a specific text field. The first one will terminate any first responder status. Meaning it will go through subviews too => less efficient
}
