//
//  MyTableViewCell.swift
//  ContactDemo
//
//  Created by iFlame on 5/29/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    
  
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var mail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
