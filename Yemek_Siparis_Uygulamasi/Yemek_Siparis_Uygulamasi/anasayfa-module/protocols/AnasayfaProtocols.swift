//
//  AnasayfaProtocols.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView: PresenterToViewAnasayfaProtocol? {get set}
    
    func yemekleriYukle()
    func ara(aramaKelimesi: String)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumYemekleriAl()
    func yemekAra(aramaKelimesi: String)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemekListe: [Yemek])
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemekListe: [Yemek])
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: Anasayfa)
}
