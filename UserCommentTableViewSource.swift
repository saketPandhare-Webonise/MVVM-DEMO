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
     
        singleComment = totalComments .objectAtIndex(indexPath.row) as! UserCommentsModel
        
        cell.userNamelbl.text = singleComment.userName as String
        cell.userEmaillbl.text = singleComment.userEmail as String
        cell.userInfolbl.text = singleComment.userDescription as String
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}
