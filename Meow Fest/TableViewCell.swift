//
//  TableViewCell.swift
//  Meow Fest
//
//  Created by John Carter on 6/12/18.
//  Copyright © 2018 Jack Carter. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionOfCat: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
