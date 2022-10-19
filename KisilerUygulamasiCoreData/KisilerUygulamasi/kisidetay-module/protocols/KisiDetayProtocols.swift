//
//  KisiDetayProtocols.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation

protocol ViewToPresenterKisiDetayProtocol {
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol? {get set}
    
    func guncelle(kisi:KisilerModel, kisi_ad:String, kisi_tel:String)
}

protocol PresenterToInteractorKisiDetayProtocol {
    func kisiGuncelle(kisi:KisilerModel, kisi_ad:String, kisi_tel:String)
}

protocol PresenterToRouterKisiDetayProtocol {
    static func createModule(ref: KisiDetayVC) 
}
