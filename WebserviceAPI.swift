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

    func callWebservice (serviceName : String , method : String, requestParameters : String?,completionHandler: (NSArray) ->Void)
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
                
                if let JSON = response.result.value
                {
                    responbseFromServer=JSON as! NSArray
                    completionHandler(responbseFromServer)
                }
                
            }

        }
        
       
        // Similary we can Write for POST/PUT/DELETE
        

    }
    
}
