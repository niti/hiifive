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
import Darwin
class MainViewController:UIViewController{
    
    @IBOutlet weak var loggedOutButton: UIButton!
    let moveToLoginScreen = "loggedOut"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let currentUser = PFUser.currentUser()
        print(currentUser)
       
        
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
    
    func setTraitSettings(arrayOfTraits:[(String, String, Bool)]){
        
        //for each in arrayofTraits
        for x in arrayOfTraits {
            
            
            let traitObject = PFObject(className: "traits")
            traitObject["question"] = x.0
            traitObject["answer"] = x.1
            traitObject["fiveThings"] = x.2
            
            traitObject.saveInBackgroundWithBlock(){
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    print("sucess saving value")
                } else {
                    // There was a problem, check error.description
                    print(error?.description)
                }
            }
            
        }
    
    }
    
    //MATCHING USERS algo
    
    func matchUsers() {
        let currentUser = PFUser.currentUser()
        
        //notifyUserMethod
    }
    
    func deg2rad(deg:Double)->Double {
        return deg * (Math.PI/180)
    }
    
    
    func getDistanceFromLatLonInKm(lat1:Double,lon1:Double,lat2:Double,lon2:Double) {
        var R = 6371 // Radius of the earth in km
        var dLat = deg2rad(lat2-lat1)  // deg2rad below
        var dLon = deg2rad(lon2-lon1)
        var a = sin(dLat/2) * sin(dLat/2) +
            cos(deg2rad(lat1)) * cos(deg2rad(lat2)) *
            sin(dLon/2) * sin(dLon/2)
        
        var c = 2 * atan2(Double(sqrt(a)), Double(sqrt(1-a)));
        var d = R * c; // Distance in km
        return d;
    }



    
}
