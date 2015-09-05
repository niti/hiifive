//
//  CoreLocationController.swift
//  HiiFive
//
//  Created by Kat Slump on 9/5/15.
//  Copyright © 2015 NKCH. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import Parse

class CoreLocationController : NSObject, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.distanceFilter  = 500 // Must move at least 100ft. (30.48 meters)
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer // Accurate within a kilometer
        self.locationManager.startUpdatingLocation()

    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("didChangeAuthorizationStatus")
        
        switch status {
        case .NotDetermined:
            print(".NotDetermined")
            break
            
        case .Authorized:
            print(".Authorized")
            locationManager.startUpdatingLocation()
            break
            
        case .Denied:
            print(".Denied")
            break
            
        default:
            print("Unhandled authorization status")
            break
            
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last as CLLocation!
        
        // STORING GEOPOINTS IN PARSE ///////////
        // Geo Location via Parse: Gets current location in
        // PFGeoPoint.geoPointForCurrentLocationInBackground {
        // (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
        // if error == nil {
        // PFUser.currentUser()!.setValue(geoPoint, forKey: "location")
        // PFUser.currentUser().saveInBackground()
        // }
        // }
    
         //OUTPUT FOR CLLOCATIONCOORDINATE2D //////////
       // print("just coordinate: \(location.coordinate)")
        // OUTPUT FROM ABOVE: just coordinate: CLLocationCoordinate2D(latitude: 39.9012854679285, longitude: -75.1722105229905)
        
        // TEST FOR CURRENT LOCATION (LAT + LONG) //////////
         print("didUpdateLocations:  \(location.coordinate.latitude), \(location.coordinate.longitude)")
         notifyUserLocation(location.coordinate.latitude,longcord: location.coordinate.longitude)
        
        // PULLS CURRENT USER INFORMATION /////////////
        // var user = PFUser.currentUser()
        // CLLocationCoordinate2D coords= user["location"]
        
        // QUERY THAT PULLS ALL USERS //////////////
        //  var query = PFUser.query()
        //  query.whereKey("attribute", equalTo:user["attribute"])
        //      var alikeAttributes = query.findObjects()
        //      print("Alike Attributes are: \(alikeAttributes)")
        
        // COMPARISON OF GEOPOINTS + ALIKE ATTRIBUTES /////////////////
        // IF PROXIMITY, QUERY THAT PULLS 5
            // COMPARES 5 BETWEEN THE 3 USERS
            // RANKS 5 BETWEEN THE 3 USERS
                // SENDS NOTIFICATION IF MATCH + PROXIMITY
                    // GET USER NAME FOR NOTIFICATION
                    // notifyUser(name: NSString);
                    // call segue to main page/menu here
        
        // POSSIBLE FEATURE: # OF FEET AWAY IMPLEMENTATION
        // # of ft by pulling km from Parse?
        
    }
    
    func notifyUserLocation(latcord: Double, longcord: Double){
        //[snippet, caption="Creating Notifications in Swift"]
        let localNotification: UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Current Latitude + Longitude Coordinates"
        localNotification.alertBody = "Lat: \(latcord) Long: \(longcord)"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        NSLog("Sent notification for lat + long")
    }
    func notifyUser(name: NSString){
        //[snippet, caption="Creating Notifications in Swift"]
        let localNotification: UILocalNotification = UILocalNotification()
        localNotification.alertBody = "\(name) you've hiifive'd someone nearby!"
        localNotification.alertAction = "Check out your timeline for more info."
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 1)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        NSLog("Sent notification for hiifive")
    }
    
}