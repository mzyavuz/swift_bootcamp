//
//  KİsiKayitInteractor.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation
import CoreData

class KisiKayitInteractor: PresenterToInteractorKisiKayitProtocol {
    let context = appDelegate.persistentContainer.viewContext //yetki
    
    func kisiEkle(kisi_ad: String, kisi_tel: String) {
        let yeniKisi = KisilerModel(context: context)
        yeniKisi.kisi_ad = kisi_ad
        yeniKisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext() //Değişiklik yaptım kaydet
    }
}
