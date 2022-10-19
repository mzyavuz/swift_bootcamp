//
//  KisiDetayInteractor.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation
import CoreData

class KisiDetayInteractor: PresenterToInteractorKisiDetayProtocol {
    
    func kisiGuncelle(kisi: KisilerModel, kisi_ad: String, kisi_tel: String) {
        kisi.kisi_ad = kisi_ad
        kisi.kisi_tel = kisi_tel
        
        appDelegate.saveContext()
    }
    
}
