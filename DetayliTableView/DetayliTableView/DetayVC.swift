//
//  DetayVC.swift
//  DetayliTableView
//
//  Created by M.Zeynep Cakmakci on 4.10.2022.
//

import UIKit

class DetayVC: UIViewController {

    @IBOutlet weak var urunResim: UIImageView!
    @IBOutlet weak var urunFiyat: UILabel!
    
    var urun: Urunler?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let u = urun {
            self.navigationItem.title = u.urunAd
            urunResim.image = UIImage(named: u.urunResimAd!)
            urunFiyat.text = "\(u.urunFiyat!) ₺"
        }

    }
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        if let u = urun {
            print("\(u.urunAd!) \(u.urunFiyat!) ₺ fiyat ile sepete eklendi")
        }
    }
    
}
