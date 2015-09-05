//
//  LoginViewController.swift
//  HiiFive
//
//  Created by Niti Paudyal on 9/5/15.
//  Copyright © 2015 NKCH. All rights reserved.
//

import Foundation

import UIKit
import Parse

class LoginViewController:UIViewController{

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButtonTapped: UIButton!
    
      let moveToMainScreen = "LoginSuccesful"
     let loggedIn = "loggedIn"
    
    //user already logged in
    
 
    @IBAction func loginButtonTapped(sender: AnyObject)
    {
        PFUser.logInWithUsernameInBackground(emailTextField.text!, password: passwordTextField.text!) { user, error in
            if user != nil {
                
           self.performSegueWithIdentifier(self.loggedIn, sender: nil)
                
                
            } else {

                let alert = UIAlertController(title: "Alert", message: "Invalid Login. Please Try again.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }

    }
}