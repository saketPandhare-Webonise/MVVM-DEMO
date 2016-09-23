//
//  UserCommentHelper.swift
//  MVVM-DEMO
//
//  Created by Weboniselab on 9/22/16.
//  Copyright © 2016 Weboniselab. All rights reserved.
//

import UIKit
import RealmSwift

class UserCommentHelper: NSObject {
    
   
    //MARK: Convertion function before saving to database
    
    func convertEmailToLowerCase (email : NSString) ->NSString
    {
       
        return email.lowercaseString
    }
    
    func properUserName (userName : NSString) -> NSString
    {
        var formattedUserName : NSString
         let extraName : NSString
        formattedUserName = userName
        
        
        let separators = NSCharacterSet(charactersInString: " ")
        var words = userName.componentsSeparatedByCharactersInSet(separators)
        
        let firstName : String = words[0]
        let middleName : String = words[1]
        let lastName : String = words[2]
        
        if (words.count > 3)
        {
            extraName  = words[3]
            
          formattedUserName = firstName + " " + middleName + " " + lastName + " ..."
        
         }
        else
        {
           formattedUserName = firstName + " " + middleName + " " + lastName
        }
     
        return formattedUserName
    }
    
    //MARK:Retreving from database
    
    func getUserComments ()->NSArray?
    {
        let realm : Realm
        realm = try! Realm()
        let comments = realm.objects(UserComments)
        return Array(comments)
    }
}
