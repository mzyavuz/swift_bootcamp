//
//  AnasayfaPresenter.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation

class AnasayfaPresenter: ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func kisileriYukle() {
        anasayfaInteractor?.tumKisilerAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.kisiAra(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(kisi: KisilerModel) {
        anasayfaInteractor?.kisiSil(kisi: kisi)
    }
    
}


extension AnasayfaPresenter: InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(kisilerListesi: [KisilerModel]) {
        anasayfaView?.vieweVeriGonder(kisilerListesi: kisilerListesi)
    }
}
