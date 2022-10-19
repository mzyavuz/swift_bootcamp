//
//  KisiDetayVC.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Yavuz on 2.10.2022.
//

import UIKit

class KisiDetayVC: UIViewController {

    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var kisi:Kisiler?

    var kisiDetayPresenterNesnesi: ViewToPresenterKisiDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        KisiDetayRouter.createModule(ref: self)
        
        if let k = kisi {
            tfKisiAd.text = k.kisi_ad
            tfKisiTel.text = k.kisi_tel
        }
        
    }
    

    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ka = tfKisiAd.text , let kt = tfKisiTel.text, let k = kisi {
            kisiDetayPresenterNesnesi?.guncelle(kisi_id: Int(k.kisi_id!)!, kisi_ad: ka, kisi_tel: kt)
        }
    }
    //http://kasimadalan.pe.hu/kisiler/tum_kisiler.php
}
