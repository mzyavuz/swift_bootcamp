//
//  presenter.swift
//  ViperKullanimi
//
//  Created by M.Zeynep Cakmakci on 6.10.2022.
//

import Foundation

class Presenter: ViewToPresenterProtocol {
    var interactor: PresenterToInteractorProtocol?
    var view: PresenterToViewProtocol?
    
    func toplaYap(sayi1: String, sayi2: String) {
        interactor?.topla(sayi1: sayi1, sayi2: sayi2)
    }
    
    func carpYap(sayi1: String, sayi2: String) {
        interactor?.carp(sayi1: sayi1, sayi2: sayi2)
    }
}

//Extension la ayırıyoruz karışık olmasın diye
extension Presenter: InteractorToPresenterProtocol {
    func presenteraVeriGonder(sonuc: String) {
        view?.vieweVeriGonder(sonuc: sonuc)
    }
}
