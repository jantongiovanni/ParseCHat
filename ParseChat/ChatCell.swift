//
//  ChatCell.swift
//  ParseChat
//
//  Created by Joe Antongiovanni on 2/25/18.
//  Copyright © 2018 Joe Antongiovanni. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
