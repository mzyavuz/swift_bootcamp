//
//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation
import Firebase

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    var refKisiler = Database.database().reference().child("kisiler")
    
    func tumKisilerAl() {
        //let sorgu = refKisiler.queryLimited(toLast: 5) // En son 5 veriyi getir
        
        refKisiler.observe(.value, with: { snapshot in
            var liste = [Kisiler]()
            
            if let gelenVeri = snapshot.value as? [String: AnyObject] {
                for satir in gelenVeri {
                    if let d = satir.value as? NSDictionary {
                        let kisi_id = satir.key
                        let kisi_ad = d["kisi_ad"] as? String ?? ""
                        let kisi_tel = d["kisi_tel"] as? String ?? ""
                        
                        let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                        liste.append(kisi)
                    }
                }
            }
            
            self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        })
        
    }
    
    func kisiAra(aramaKelimesi: String) {
        //let sorgu = refKisiler.queryOrdered(byChild: "kisi_ad").queryEqual(toValue: aramaKelimesi) //Birebir aynı olduğu zaman değer okunuyor, sonra refKisiler.observe yerine sorgu.observe yazıyorsun
        
        refKisiler.observe(.value, with: { snapshot in
            var liste = [Kisiler]()
            
            if let gelenVeri = snapshot.value as? [String: AnyObject] {
                for satir in gelenVeri {
                    if let d = satir.value as? NSDictionary {
                        let kisi_id = satir.key
                        let kisi_ad = d["kisi_ad"] as? String ?? ""
                        let kisi_tel = d["kisi_tel"] as? String ?? ""
                        
                        if kisi_ad.lowercased().contains(aramaKelimesi.lowercased()) {
                            let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                            liste.append(kisi)
                        }
                        
                        //let kisi = Kisiler(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
                        //liste.append(kisi)
                    }
                    
                   
                }
            }
            
            self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        })
    }
    
    func kisiSil(kisi_id: String) {
        refKisiler.child(kisi_id).removeValue()
    }
}
