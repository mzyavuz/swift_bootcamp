//
//  UrunTableViewCell.swift
//  DetayliTableView
//
//  Created by M.Zeynep Cakmakci on 4.10.2022.
//

import UIKit

protocol HucreProtocol {
    func buttonTiklandi(indexPath: IndexPath) // Hangisi tıklandı --> indexPath bunu veriyor
}

class UrunTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hucreArkaplan: UIView!
    @IBOutlet weak var urunResimImageView: UIImageView!
    @IBOutlet weak var urunAdLabel: UILabel!
    @IBOutlet weak var urunFiyatLabel: UILabel!
    
    var hucreProtocol: HucreProtocol?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buttonSepeteEkle(_ sender: Any) {
        print("Button tıklandı") // Hangi buton? İki sayfa arasında bilgi alişverişi olmalı, viewControlle haber gitmeli
        // Bu yüzden protokol kullanmak gerekiyor
        // Bunu çalıştırmak için viewcontrollerdan nesneye ihtiyacım var --> HucreProtocol
        hucreProtocol?.buttonTiklandi(indexPath: indexPath!) //indexPath lazım dışardan --> indexPath
    }
}
