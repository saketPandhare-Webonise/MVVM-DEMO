//
//  ViewController.swift
//  MVVM-DEMO
//
//  Created by Weboniselab on 9/22/16.
//  Copyright © 2016 Weboniselab. All rights reserved.
//

import UIKit
import Alamofire



class UserCommentVC: UIViewController {

    @IBOutlet weak var userCommentCollectionView: UICollectionView!
    
    @IBOutlet weak var userCommentTableView: UITableView!
    private let myDataSource = UserCommentTableViewSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.getComments()
        
        userCommentTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        userCommentTableView.dataSource = myDataSource
        userCommentTableView.delegate = myDataSource
        
       self.showHudOnView()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getComments ()->Void
    {
        
        WebServiceWrapper().getComments({ (response , success) -> Void in
            
             if (success)
            {
                print("success has \(success)")
                let response = response as NSArray
                for index in 0 ..< response.count
                {
                    UserCommentsModel().setUserCommentsIntoDb(response .objectAtIndex(index) as! NSDictionary)
                }
                self.userCommentTableView .reloadData()
                UIHelper().hideHud(self.view)
            }
            else
             {
                print("you got any error ")
            }
            

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

