//
//  LeftMenuTableCell.swift
//  ParkStash Coding Challenge
//
//  Created by Shreyas Zagade on 3/22/18.
//  Copyright © 2018 Shreyas Zagade. All rights reserved.
//

import UIKit

class LeftMenuTableCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
