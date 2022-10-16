//
//  KisiDetayInteractor.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation
import Firebase

class KisiDetayInteractor: PresenterToInteractorKisiDetayProtocol {
    var refKisiler = Database.database().reference().child("kisiler")
    
    func kisiGuncelle(kisi_id: String, kisi_ad: String, kisi_tel: String) {
        let guncellenenKisi = ["kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        refKisiler.child(kisi_id).updateChildValues(guncellenenKisi)
    }
    
}
