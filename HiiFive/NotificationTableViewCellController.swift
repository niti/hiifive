//
//  NotificationTableViewCellController.swift
//  HiiFive
//
//  Created by Harshita Gupta on 9/6/15.
//  Copyright © 2015 NKCH. All rights reserved.
//

import Foundation
import UIKit

class NotificationTableViewCellController : UITableViewCell {
    
    @IBOutlet var userImage: UIImageView!
    
    @IBOutlet var commonCharacteristic: UILabel!
    
    @IBOutlet var characteristicType: UILabel!
    
    func setUser(image: UIImage, common: String, characteristicTypeStr : String) {
        userImage.image = image
        commonCharacteristic.text = common
        characteristicType.text = characteristicTypeStr
        
    }
    
}