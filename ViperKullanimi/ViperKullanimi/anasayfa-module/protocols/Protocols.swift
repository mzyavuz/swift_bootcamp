//
//  Protocols.swift
//  ViperKullanimi
//
//  Created by M.Zeynep Cakmakci on 6.10.2022.
//

import Foundation

// View --> Presenter --> Interactor

// Ana Protocoller (-->)
protocol ViewToPresenterProtocol {
    var interactor: PresenterToInteractorProtocol? {get set}
    var view: PresenterToViewProtocol? {get set}
    
    func toplaYap(sayi1: String, sayi2: String)
    func carpYap(sayi1: String, sayi2: String)
}

protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? {get set}
    
    func topla(sayi1: String, sayi2: String)
    func carp(sayi1: String, sayi2: String)
}


// View <-- Presenter <-- Interactor

//Taşıyıcı protocoller (<--)
protocol InteractorToPresenterProtocol {
    func presenteraVeriGonder(sonuc: String)
}

protocol PresenterToViewProtocol {
    func vieweVeriGonder(sonuc: String)
}

//Router
protocol PresenterToRouterProtocol {
    static func createModule(ref: ViewController) 
}
