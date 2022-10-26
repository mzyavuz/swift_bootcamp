//
//  SepetTableViewCell.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

    @IBOutlet weak var sepetYemekResim: UIImageView!
    
    @IBOutlet weak var sepetYemekAdLabel: UILabel!
    
    @IBOutlet weak var sepetSiparisAdetLabel: UILabel!
    @IBOutlet weak var sepetStepper: UIStepper!
    
    @IBOutlet weak var sepetUcretLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
