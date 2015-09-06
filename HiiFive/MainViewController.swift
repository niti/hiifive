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
    @IBOutlet weak var placeValue: UITextField!
    
    @IBOutlet weak var lookingForValue: UITextField!
    @IBOutlet weak var occupationValue: UITextField!
    @IBOutlet weak var groupValue: UITextField!
    @IBOutlet weak var educationValue: UITextField!
    let moveToLoginScreen = "loggedOut"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let currentUser = PFUser.currentUser()
        print(currentUser)
       
        
    }
    
    @IBAction func placeTraitValueChanged(sender: AnyObject) {
        print("place trait value changed")
        setTraitSettings([("place",placeValue.text, true)])
    }
    
    @IBAction func groupTraitValueChanged(sender: AnyObject) {
        print("group trait value changed")
        setTraitSettings([("group",groupValue.text, true)])
    }
    
    @IBAction func lookingForTraitValueChanged(sender: AnyObject) {
        print("looking for trait value changed")
        setTraitSettings([("lookingFor", lookingForValue.text, true)])
    }
    
    @IBAction func educationTraitValueChanged(sender: AnyObject) {
        setTraitSettings([("education",educationValue.text, true)])
    }
    
    @IBAction func occupationTraitValueChanged(sender: AnyObject) {
        setTraitSettings([("occupation",occupationValue.text, true)])
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
    
    
    
    func setTraitSettings(arrayOfTraits:[(String, String?, Bool)]){
        
        let currentUser = PFUser.currentUser()!
        
        //for each in arrayofTraits
        for x in arrayOfTraits {
            
            
            let traitObject = PFObject(className: "traits")
            traitObject["question"] = x.0
            traitObject["answer"] = x.1
            traitObject["fiveThings"] = x.2
            
            traitObject["user"] = currentUser
            currentUser["traits"] = traitObject
            
            currentUser.save()
            
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
    /**
    func matchUsers() {
        let currentUser = PFUser.currentUser()
        
        //notifyUserMethod
    }

**/
    
    func deg2rad(deg:Double)->Double {
        let pi = 3.1415926535897931
        return deg * (pi/180)
    }
    
    
    func getDistanceFromLatLonInKm(lat1:Double,lon1:Double,lat2:Double,lon2:Double) ->Double {
        let R = 6371 // Radius of the earth in km
        let dLat = deg2rad(lat2-lat1)  // deg2rad below
        let dLon = deg2rad(lon2-lon1)
        let a = sin(dLat/2) * sin(dLat/2) +
            cos(deg2rad(lat1)) * cos(deg2rad(lat2)) *
            sin(dLon/2) * sin(dLon/2)
        
        let c = 2 * atan2(Double(sqrt(a)), Double(sqrt(1-a)));
        let d = Double(R) * Double(c); // Distance in km
        return d;
    }



    
}
