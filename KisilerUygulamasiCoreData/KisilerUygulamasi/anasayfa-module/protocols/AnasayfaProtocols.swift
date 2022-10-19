//
//  AnasayfaProtocols.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView: PresenterToViewAnasayfaProtocol? {get set}
    
    func kisileriYukle()
    func ara(aramaKelimesi: String)
    func sil(kisi: KisilerModel)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumKisilerAl()
    func kisiAra(aramaKelimesi: String)
    func kisiSil(kisi: KisilerModel)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(kisilerListesi: [KisilerModel])
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(kisilerListesi: [KisilerModel])
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC)
}
