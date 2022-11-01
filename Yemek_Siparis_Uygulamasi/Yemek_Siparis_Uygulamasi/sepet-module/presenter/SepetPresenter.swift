//
//  SepetPresenter.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import Foundation

class SepetPresenter: ViewToPresenterSepetProtocol {
    
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    var sepetView: PresenterToViewSepetProtocol?
    
    func sepettekiYemekleriYukle(kullanici_adi: String) {
        sepetInteractor?.sepettekiTumYemekleriAl(kullanici_adi: kullanici_adi)
    }
    
    func yemekSil(sepet_yemek_id: String, kullanici_adi: String) {
        sepetInteractor?.sepettenYemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
}

extension SepetPresenter: InteractorToPresenterSepetProtocol {

    func presenteraVeriGonder(sepetYemekListe: [Yemek]) {
        sepetView?.vieweVeriGonder(sepetYemekListe: sepetYemekListe)
    }
    
    func presenteraToplamUcretiGonder(sepet_ucret: Int) {
        sepetView?.viewaToplamUcretiGonder(sepet_ucret: sepet_ucret)
    }
    
    
}
