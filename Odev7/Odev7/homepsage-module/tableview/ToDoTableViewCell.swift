//
//  ToDoTableViewCell.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    @IBOutlet weak var todoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
