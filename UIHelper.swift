//
//  UIHelper.swift
//  MVVM-DEMO
//
//  Created by Weboniselab on 9/22/16.
//  Copyright © 2016 Weboniselab. All rights reserved.
//

import UIKit

class UIHelper: NSObject {

     var spinnerActivity = MBProgressHUD()
    func showHudOnView (view : UIView)
    {
        spinnerActivity = MBProgressHUD.showHUDAddedTo(view, animated: true);
        
        spinnerActivity.label.text = "Loading";
        
        spinnerActivity.detailsLabel.text = "Please Wait!!";
        
        spinnerActivity.userInteractionEnabled = false;
    }
    
    func hideHud (view : UIView)
    {
        MBProgressHUD.hideAllHUDsForView(view, animated: true);
    }
    
    func showInternetConnectionAlert()
    {
        let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
        alert.show()
    }
}
