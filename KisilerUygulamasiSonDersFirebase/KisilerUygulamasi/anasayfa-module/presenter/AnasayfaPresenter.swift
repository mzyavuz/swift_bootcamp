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
    
    func sil(kisi_id: String) {
        anasayfaInteractor?.kisiSil(kisi_id: kisi_id)
    }
    
}


extension AnasayfaPresenter: InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(kisilerListesi: [Kisiler]) {
        anasayfaView?.vieweVeriGonder(kisilerListesi: kisilerListesi)
    }
}
