//
//  YemekDetayVC.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import UIKit

class YemekDetayVC: UIViewController {

    @IBOutlet weak var yemekResim: UIImageView!
    @IBOutlet weak var yemekFiyat: UILabel!
    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var siparisAdetLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var yemek: Yemek?
    var kullanici_adi: String?
    
    var yemekDetayPresenterNesnesi: ViewToPresenterYemekDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        YemekDetayRouter.createModule(ref: self)

        ResimFunction().resimYukle(yemek: yemek!, imageView: yemekResim)
        yemekFiyat.text = "\(yemek!.yemek_fiyat!) ₺"
        yemekAdLabel.text = yemek!.yemek_adi
        
        siparisAdetLabel.text = String(Int(stepper.value))
        
        kullanici_adi = "mzyavuz"
    }
    
    @IBAction func stepperBasildi(_ sender: UIStepper) {
        siparisAdetLabel.text = String(Int(sender.value))
    }
    @IBAction func sepeteEkleButton(_ sender: Any) {
        if let adet = siparisAdetLabel.text, let ka = kullanici_adi, let y = yemek {
            yemekDetayPresenterNesnesi?.sepeteEkle(yemek:y, yemek_siparis_adet: adet, kullanici_adi: ka)
        }
    }
    
}
