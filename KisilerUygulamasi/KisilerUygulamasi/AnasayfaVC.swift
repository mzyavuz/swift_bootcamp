//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Yavuz on 2.10.2022.
//

import UIKit

class AnasayfaVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDetay(_ sender: Any) {
        let kisi = Kisiler(kisi_id: 8, kisi_ad: "Ece", kisi_tel: "9999")
        performSegue(withIdentifier: "toDetay", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // Sayfa geçişindeki veri transferini okumak için
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetayVC
                gidilecekVC.kisi = kisi
            }
        }
    }
}

