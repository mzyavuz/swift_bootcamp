//
//  YemekDetayProtocols.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import Foundation

protocol ViewToPresenterYemekDetayProtocol {
    var yemekDetayInteractor: PresenterToInteractorYemekDetayProtocol? {get set}
    
    func sepeteEkle(yemek: Yemek, yemek_siparis_adet:String, kullanici_adi:String)
}

protocol PresenterToInteractorYemekDetayProtocol {
    func yemekSepeteEkle(yemek: Yemek, yemek_siparis_adet:String, kullanici_adi:String)
}

protocol PresenterToRouterYemekDetayProtocol {
    static func createModule(ref: YemekDetayVC)
}
