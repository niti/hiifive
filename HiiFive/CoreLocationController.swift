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

class CoreLocationController : NSObject, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.distanceFilter  = 30.48 // Must move at least 100ft. (30.48 meters)
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer // Accurate within a kilometer

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
    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//        let location = locations.last as CLLocation!
//        print("didUpdateLocations:  \(location.coordinate.latitude), \(location.coordinate.longitude)")
//        notifyUser(location.coordinate.latitude,longcord: location.coordinate.longitude)
//        
//    }
    
    func notifyUser(latcord: Double, longcord: Double){
        //[snippet, caption="Creating Notifications in Swift"]
        let localNotification: UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Current Latitude + Longitude Coordinates"
        localNotification.alertBody = "Lat: \(latcord) Long: \(longcord)"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        NSLog("Sent notification")
    }
    
}