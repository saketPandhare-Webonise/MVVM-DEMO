//
//  userCommentCollectionDataSource.swift
//  MVVM-DEMO
//
//  Created by Weboniselab on 9/22/16.
//  Copyright © 2016 Weboniselab. All rights reserved.
//

import UIKit

class UserCommentTableViewSource: NSObject,UITableViewDelegate,UITableViewDataSource{
    
    var totalComments : NSArray = []
    
    
     
    //MARK: Table view delegate methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return (UserCommentHelper().getUserComments()?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        totalComments = UserCommentHelper().getUserComments()!
        var singleComment = UserCommentsModel()
        let cell:CommentTableCell = tableView.dequeueReusableCellWithIdentifier("commentCell")! as! CommentTableCell
        
       // cell.backgroundColor = UIColor.whiteColor()
//        cell.layer.borderWidth = 1.0
//        cell.layer.borderColor = UIColor.blackColor().CGColor
//        //cell.layer.cornerRadius = 20
        
        singleComment = totalComments .objectAtIndex(indexPath.row) as! UserCommentsModel
        
        cell.userNamelbl.text = singleComment.userName as String
        cell.userEmaillbl.text = singleComment.userEmail as String
        cell.userInfolbl.text = singleComment.userDescription as String
        
        
        
//        let whiteRoundedView : UIView = UIView(frame: CGRectMake(5, 8, tableView.frame.size.width - 10, tableView.frame.size.height-10))
//        
//        whiteRoundedView.layer.backgroundColor = CGColorCreate(CGColorSpaceCreateDeviceRGB(), [1.0, 1.0, 1.0, 0.8])
//        whiteRoundedView.layer.masksToBounds = false
//        whiteRoundedView.layer.cornerRadius = 2.0
//        whiteRoundedView.layer.shadowOffset = CGSizeMake(-1, 1)
//        whiteRoundedView.layer.shadowOpacity = 0.2
//        
//        cell.contentView.addSubview(whiteRoundedView)
//        cell.contentView.sendSubviewToBack(whiteRoundedView)
//
        //cell.textLabel?.text = "saket"
        return cell
    }
    
    
     
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}
