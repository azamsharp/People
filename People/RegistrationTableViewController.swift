//
//  RegistrationTableViewController.swift
//  People
//
//  Created by Mohammad Azam on 12/1/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class RegistrationTableViewController : UITableViewController {
    
    @IBOutlet weak var usernameTextField :UITextField!
    @IBOutlet weak var passwordTextField :UITextField!
    
    @IBOutlet weak var messageLabel :UILabel!
    
    private var dataAccess :DataAccess!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataAccess = DataAccess()
    }
    
    @IBAction func saveButtonClicked() {
        
        let user = User(username: self.usernameTextField.text!, password: self.passwordTextField.text!)
        
        let isSaved = self.dataAccess.saveUser(user)
        
        if isSaved {
            performSegue(withIdentifier: "LoginTableViewController", sender: self)
        } else {
            self.messageLabel.text = "User name is already taken"
        }
    }
}
