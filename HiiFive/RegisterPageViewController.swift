//
//  RegisterPageViewController.swift
//  HiiFive
//
//  Created by Niti Paudyal on 9/5/15.
//  Copyright © 2015 NKCH. All rights reserved.
//

import Foundation
import UIKit
import Parse

class RegisterPageViewController:UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var repeatPassword: UITextField!
    @IBOutlet weak var registerButton: UIButton!
   let moveToMainScreen = "RegSuccesful"
    
    @IBAction func registerButtonTapped(sender:AnyObject){
        
        let userEmail = emailTextField.text
        let userPassword = passwordTextField.text
        let userRepeatPassword = repeatPassword.text
        
        //check for empty fields 
        
        if(userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty){
            
            //display an alert message 
            
            let alert = UIAlertController(title: "Alert", message: "All fields are necessary", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            return
        }
        
        //check if passwords are necessar
        
        if(userPassword != userRepeatPassword){
            //display an alert message
            let alert = UIAlertController(title: "Alert", message: "Password does not match", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            return
        }
        
        
        let user = PFUser()
        
        //2
        user.username = emailTextField.text
        user.password = passwordTextField.text
        
        //3
        user.signUpInBackgroundWithBlock { succeeded, error in
            if (succeeded) {
                //The registration was successful, go to the wall
                
                //self.performSegueWithIdentifier(self.scrollViewWallSegue, sender: nil)
                
                let thealert = UIAlertController(title: "Alert", message: "Successful Registration", preferredStyle: UIAlertControllerStyle.Alert)
                thealert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                self.performSegueWithIdentifier(self.moveToMainScreen, sender: nil)
            } else {
                //Something bad has occurred
                let alert = UIAlertController(title: "Alert", message: "Login unsucessful", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        
        
        
    }
    
}