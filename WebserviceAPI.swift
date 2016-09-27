//
//  WebserviceAPI.swift
//  MVVM-DEMO
//
//  Created by Weboniselab on 9/22/16.
//  Copyright © 2016 Weboniselab. All rights reserved.
//

import UIKit
import Alamofire

class WebserviceAPI: NSObject {

    func callWebservice (serviceName : String , method : String, requestParameters : String?,completionHandler: (NSArray , success : Bool) ->Void)
    {
        
        if Reachability.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            UIHelper().showInternetConnectionAlert()
            print("Internet connection FAILED")
            return 
        }
        
        if (method == Constants.GET)
        {
        Alamofire.request(.GET,Constants.BASEURL+Constants.COMMENT, parameters: nil)
            .responseJSON {
                response in
                var responbseFromServer: NSArray
                
                let JSON = response.result.value
                if ((JSON) != nil && JSON?.error == nil)
                {
                    responbseFromServer=JSON as! NSArray
                    completionHandler(responbseFromServer ,success: true)
                }
                else
                {
                    responbseFromServer=JSON as! NSArray
                    completionHandler(responbseFromServer ,success: false)
                }
                
            }

        }
        
       
        // Similary we can Write for POST/PUT/DELETE
        

    }
    
}
