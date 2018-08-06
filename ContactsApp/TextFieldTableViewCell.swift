//
//  TextFieldTableViewCell.swift
//  ContactsApp
//
//  Created by Vinay Ponnuri on 8/6/18.
//  Copyright © 2018 Vinay Ponnuri. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
