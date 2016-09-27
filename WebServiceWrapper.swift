//
//  UserCommentWSWrapper.swift
//  MVVM-DEMO
//
//  Created by Weboniselab on 9/27/16.
//  Copyright © 2016 Weboniselab. All rights reserved.
//

import UIKit

class WebServiceWrapper: NSObject {

    func getComments (completion: (result: NSArray , success : Bool) -> Void)
    {
        WebserviceAPI().callWebservice(Constants.BASEURL, method: Constants.GET, requestParameters: nil, completionHandler: { (response , success) -> Void in
           
            completion( result: response , success: success)
            
        })
    }
    
}
