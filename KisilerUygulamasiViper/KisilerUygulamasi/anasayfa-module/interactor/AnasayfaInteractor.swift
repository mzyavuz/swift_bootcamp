//
//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumKisilerAl() {
        var liste = [Kisiler]()
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Ece", kisi_tel: "2222")
        liste.append(k1)
        liste.append(k2)
        anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
    }
    
    func kisiAra(aramaKelimesi: String) {
        print("Kisi Ara: \(aramaKelimesi)")
    }
    
    func kisiSil(kisi_id: Int) {
        print("Kisi Sil: \(kisi_id)")
    }
}
