//
//  KİsiKayitInteractor.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation

class KisiKayitInteractor: PresenterToInteractorKisiKayitProtocol {
    func kisiEkle(kisi_ad: String, kisi_tel: String) {
        print("Kişi Kayıt : \(kisi_ad) - \(kisi_tel)")
    }
}
