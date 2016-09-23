//
//  userCommentCollectionDataSource.swift
//  MVVM-DEMO
//
//  Created by Weboniselab on 9/22/16.
//  Copyright © 2016 Weboniselab. All rights reserved.
//

import UIKit

class userCommentCollectionDataSource: NSObject ,UICollectionViewDataSource,UICollectionViewDelegate{
    
    var totalComments : NSArray = []
    
    //MARK: collection view delegate methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // store all the comments in global array tp access it in cell for row method
        
      totalComments = UserCommentHelper().getUserComments()!
       return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (UserCommentHelper().getUserComments()?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var singleComment = UserComments()
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CommentCollectionCell
        cell.backgroundColor = UIColor.lightGrayColor()
        singleComment = totalComments .objectAtIndex(indexPath.row) as! UserComments
        cell.userNamelbl.text = singleComment.userName as String
        cell.userEmaillbl.text = singleComment.userEmail as String
        cell.userInfolbl.text = singleComment.userDescription as String
        
        return cell
        
    }
    

    
    
}
