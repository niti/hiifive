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
    
    //user already logged in
    
 
    @IBAction func loginButtonTapped(sender: AnyObject)
    {
        PFUser.logInWithUsernameInBackground(emailTextField.text!, password: passwordTextField.text!) { user, error in
            if user != nil {
                self.performSegueWithIdentifier(self.moveToMainScreen, sender: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: "Error in password or email", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "C```lick", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }

    }
}