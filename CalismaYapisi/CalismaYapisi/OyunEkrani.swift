//
//  OyunEkrani.swift
//  CalismaYapisi
//
//  Created by Kasım on 29.09.2022.
//

import UIKit

class OyunEkrani: UIViewController {
    
    //var mesaj: String?
    // oyun ekranına geçiş yapıp değeri aktarmam lazım
    var kisi: Kisiler?
    

    override func viewDidLoad() { // sayfa açıldığında çalışan metod
        super.viewDidLoad()
        
        /*if let m = mesaj {
            print("Gelen mesaj : \(m)")
        }*/
        
        if let k = kisi {
            print("Kisi ad : \(k.ad!)")
            print("Kisi yas : \(k.yas!)")
            print("Kisi boy : \(k.boy!)")
            print("Kisi bekar : \(k.bekar!)")
        }

    }
    @IBAction func buttonGeri(_ sender: Any) {
        //navigationController?.popViewController(animated: true)
        // Pop: Geri dönüşü temsil eder, Back stack : Arkaplandaki yığın
        navigationController?.popToRootViewController(animated: true) // Anasayfaya geri dönüş
    }

    @IBAction func buttonBitir(_ sender: Any) {
        performSegue(withIdentifier: "sonucEkraninaGecis", sender: nil)
    }
}
