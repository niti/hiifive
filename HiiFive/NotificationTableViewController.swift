//
//  NotificationTableViewController.swift
//  HiiFive
//
//  Created by Harshita Gupta on 9/6/15.
//  Copyright © 2015 NKCH. All rights reserved.
//

import Foundation
import Parse

class NotificationTableViewController: UITableViewController {
    
    var currentUser = PFUser.currentUser()
    
    //func allDates() --> [
    
//    //number of sections
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
////        return 1
//    }
//    
//    //number of rows
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return Singleton.sharedInstance.posts.count
//    }
//    
//    // cell heights
//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
////        if (indexPath.row == 0) {
////            return UITableViewAutomaticDimension
////        }
////            
////        else {
////            return 110
////        }
//    }
//    
//    //populates table with cells
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
////        var cell : ArticleTableViewCell
////        
////        if (indexPath.row == 0) {
////            cell = tableView.dequeueReusableCellWithIdentifier("mostRecentPreview", forIndexPath: indexPath) as! LeadArticleTableViewCell
////        }
////            
////        else {
////            cell = tableView.dequeueReusableCellWithIdentifier("article", forIndexPath: indexPath) as! GeneralArticleTableViewCell
////        }
////        
////        let currentArticle = parsing.articleForPostAtIndex(indexPath.row)
////        
////        cell.setArticle(currentArticle)
////        
////        //        cell.setNeedsDisplay()
////        
////        return cell
//    }
//    
    
    @IBAction func refreshPulled(sender: AnyObject) {

        //call the location func thingy that calculates nearby people
        //call obj.fetch()
        //        currentPage = 1;
//        parsing.getWebDataFromCategory(currentCategory.slug!, page_number: currentPage, completion: nil)
//        refresher.endRefreshing()
    }

}