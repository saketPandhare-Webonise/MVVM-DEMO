//
//  CommentTableCell.swift
//  MVVM-DEMO
//
//  Created by Weboniselab on 9/27/16.
//  Copyright © 2016 Weboniselab. All rights reserved.
//

import UIKit

class CommentTableCell: UITableViewCell {
    
    @IBOutlet weak var userNamelbl: UILabel!
    @IBOutlet weak var userEmaillbl: UILabel!
    
    @IBOutlet weak var userInfolbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
