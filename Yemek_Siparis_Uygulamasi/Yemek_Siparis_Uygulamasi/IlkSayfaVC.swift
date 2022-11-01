//
//  IlkSayfaVC.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 1.11.2022.
//

import UIKit

class IlkSayfaVC: UIViewController {

    @IBOutlet weak var kullaniciAdiTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sipariseBaslaBasildi(_ sender: Any) {
        performSegue(withIdentifier: "toAnasayfa", sender: kullaniciAdiTF.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAnasayfa"
        {
            if let kullanici_adi = sender as? String {
                let gidilecekVC = segue.destination as! Anasayfa
                gidilecekVC.kullanici_adi = kullanici_adi
                print(kullanici_adi)
            }
        }
    }
}
