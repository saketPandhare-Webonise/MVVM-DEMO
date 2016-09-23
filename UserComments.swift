//
//  UserComments.swift
//  MVVM-DEMO
//
//  Created by Weboniselab on 9/22/16.
//  Copyright © 2016 Weboniselab. All rights reserved.
//

import UIKit
import RealmSwift

class UserComments: Object {

    dynamic var userDescription : NSString = ""
    dynamic var userEmail : NSString = ""
    dynamic var userName : NSString = ""
    dynamic var postID : Int = 0
    dynamic var userID : Int = 0
    
    
    
    override static func primaryKey() -> String? {
        return "userID"
    }
    
    func setUserCommentsIntoDb (singleCommentDictionary : NSDictionary) ->Void
    {
        let realm : Realm
        realm = try! Realm()

        let userComment = UserComments()
        userComment.userDescription = singleCommentDictionary .valueForKey(Constants.BODY) as! NSString
        userComment.userEmail = UserCommentHelper().convertEmailToLowerCase(singleCommentDictionary.valueForKey(Constants.USEREMAIL) as! NSString)
        userComment.userName = UserCommentHelper().properUserName(singleCommentDictionary.valueForKey(Constants.USERNAME) as! NSString)
        userComment.postID = singleCommentDictionary.valueForKey(Constants.POSTID) as! Int
        userComment.userID = singleCommentDictionary.valueForKey(Constants.USERID) as! Int
        
        try! realm.write {
             realm.add(userComment, update: true)
        }
    }
    
        
}
