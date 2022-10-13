//
//  KİsiKayitInteractor.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation

class KisiKayitInteractor: PresenterToInteractorKisiKayitProtocol {
    
    let db: FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func kisiEkle(kisi_ad: String, kisi_tel: String) {
        print("Kişi Kayıt : \(kisi_ad) - \(kisi_tel)")
    }
}
