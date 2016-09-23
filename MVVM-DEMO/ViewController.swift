//
//  ViewController.swift
//  MVVM-DEMO
//
//  Created by Weboniselab on 9/22/16.
//  Copyright © 2016 Weboniselab. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UIViewController {

    @IBOutlet weak var userCommentCollectionView: UICollectionView!
    private let myDataSource = userCommentCollectionDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.getComments()
        userCommentCollectionView.dataSource = myDataSource
        userCommentCollectionView.delegate = myDataSource
       self.showHudOnView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getComments ()->Void
    {
        WebserviceAPI().callWebservice(Constants.BASEURL, method: Constants.GET, requestParameters: nil, completionHandler: { (r) -> Void in
            
            let response = r as NSArray

          for index in 0 ..< response.count
          {
            UserComments().setUserCommentsIntoDb(response .objectAtIndex(index) as! NSDictionary)
          }
            self.userCommentCollectionView .reloadData()
            UIHelper().hideHud(self.view)
            
        })
    }
    
    func showHudOnView ()
    {
        if (UserCommentHelper().getUserComments()?.count == 0)
        {
            UIHelper().showHudOnView(self.view)
        }
    }
    
}

