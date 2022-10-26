//
//  AnasayfaPresenter.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import Foundation

class AnasayfaPresenter: ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func yemekleriYukle() {
        anasayfaInteractor?.tumYemekleriAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.yemekAra(aramaKelimesi: aramaKelimesi)
    }
    
}

extension AnasayfaPresenter: InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemekListe: [Yemek]) {
        anasayfaView?.vieweVeriGonder(yemekListe: yemekListe)
    }
}
