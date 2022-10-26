//
//  YemekDetayPresenter.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import Foundation

class YemekDetayPresenter: ViewToPresenterYemekDetayProtocol {
    var yemekDetayInteractor: PresenterToInteractorYemekDetayProtocol?
    
    func sepeteEkle(yemek: Yemek, yemek_siparis_adet: String, kullanici_adi: String) {
        yemekDetayInteractor?.yemekSepeteEkle(yemek: yemek, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
    
    
}
