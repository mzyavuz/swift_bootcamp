//
//  SepetProtocols.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import Foundation

protocol ViewToPresenterSepetProtocol {
    var sepetInteractor: PresenterToInteractorSepetProtocol? {get set}
    var sepetView: PresenterToViewSepetProtocol? {get set}
    
    func sepettekiYemekleriYukle(kullanici_adi: String)
    func yemekSil(sepet_yemek_id: String, kullanici_adi: String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter: InteractorToPresenterSepetProtocol? {get set}
    
    func sepettekiTumYemekleriAl(kullanici_adi: String)
    func sepettenYemekSil(sepet_yemek_id: String, kullanici_adi: String)
}

protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetYemekListe: [Yemek])
    func presenteraToplamUcretiGonder(sepet_ucret: Int)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetYemekListe: [Yemek])
    func viewaToplamUcretiGonder(sepet_ucret: Int)
}

protocol PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetVC)
}
