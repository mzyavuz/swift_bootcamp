//
//  ViewController.swift
//  UserDefaultKullanimi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSayac: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ud = UserDefaults.standard // Çalışmak için yetki veriyor (tanımlanma)
        
        //Kayıt
        ud.set("Ahmet", forKey: "ad") // Kalıcı oldu
        ud.set(23, forKey: "yas")
        ud.set(1.72, forKey: "boy")
        ud.set(true, forKey: "bekar")
        
        let liste = ["ali", "ece"]
        ud.set(liste, forKey: "liste")
        
        let sehirler = ["16":"BURSA", "34":"İSTANBUL"]
        ud.set(sehirler, forKey: "sehirler")
        
        //Silme
        ud.removeObject(forKey: "ad")
        
        //Okuma
        let gelenAd = ud.string(forKey: "ad") ?? "isim yok"
        // ?? varsayılan değer
        let gelenYas = ud.integer(forKey: "yas") //Varsayılan değer: 0
        let gelenBoy = ud.double(forKey: "boy") // Varsayılan değer: 0.0
        let gelenBekar = ud.bool(forKey: "bekar") // Varsayılan değer: false
        let gelenListe = ud.array(forKey: "liste") ?? [String]()
        let gelenSehirler = ud.dictionary(forKey: "sehirler") ?? [String:String]()
        
        print("Gelen Ad: \(gelenAd)")
        print("Gelen Yas: \(gelenYas)")
        print("Gelen Boy: \(gelenBoy)")
        print("Gelen Bekar: \(gelenBekar)")
        
        for a in gelenListe {
            print("Gelen Arkadaş: \(a)")
        }
        
        for (anahtar,deger) in gelenSehirler {
            print("\(anahtar) : \(deger)")
        }
        
        // Sayac Uygulaması
        var sayac = ud.integer(forKey: "sayac")
        
        sayac = sayac + 1
        ud.set(sayac, forKey: "sayac")
        
        labelSayac.text = String(sayac)
    }

    

}

