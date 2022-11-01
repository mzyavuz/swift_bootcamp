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
    var kullanici_adi = "Melike"
    
    var yemekDetayPresenterNesnesi: ViewToPresenterYemekDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        YemekDetayRouter.createModule(ref: self)

        ResimFunction().resimYukle(yemek: yemek!, imageView: yemekResim)
        yemekFiyat.text = "\(yemek!.yemek_fiyat!) ₺"
        yemekAdLabel.text = yemek!.yemek_adi
        
        siparisAdetLabel.text = String(Int(stepper.value))
        
    }
    
    
    @IBAction func stepperBasildi(_ sender: UIStepper) {
        siparisAdetLabel.text = String(Int(sender.value))
        yemekFiyat.text = Int(stepper.value) == 1 ? "\(yemek!.yemek_fiyat!) ₺" : "\(yemek!.yemek_fiyat!) ₺ x \(Int(stepper.value)) = \(Int(stepper.value) * Int(yemek!.yemek_fiyat!)!) ₺"
    }
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        if let adet = siparisAdetLabel.text, let y = yemek {
            print(yemek!.kullanici_adi!)
            yemekDetayPresenterNesnesi?.sepeteEkle(yemek:y, yemek_siparis_adet: adet, kullanici_adi: yemek!.kullanici_adi!)
        }
    }
    
    @IBAction func sepeteGitButtonaBasildi(_ sender: Any) {
        kullanici_adi = yemek!.kullanici_adi!
        performSegue(withIdentifier: "toSepet", sender: kullanici_adi)
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSepet" {
            if let kullanici_adi = sender as? String {
                let gidilecekVC = segue.destination as! SepetVC
                gidilecekVC.kullanici_adi = kullanici_adi
                print("Prepare \(kullanici_adi)")
            }
        }
    }*/
    
}
