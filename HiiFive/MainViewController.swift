//
//  MainViewController.swift
//  HiiFive
//
//  Created by Niti Paudyal on 9/5/15.
//  Copyright © 2015 NKCH. All rights reserved.
//


import Foundation
import UIKit
import Parse

class MainViewController:UIViewController{
    
    @IBOutlet weak var loggedOutButton: UIButton!
    let moveToLoginScreen = "loggedOut"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    @IBAction func loggedOutButtonTapped(sender: AnyObject)
    {
        PFUser.logOut()
        self.performSegueWithIdentifier(self.moveToLoginScreen, sender: nil)
    
    }


    
}
