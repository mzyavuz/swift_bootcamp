//
//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation
import CoreData

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    let context = appDelegate.persistentContainer.viewContext
    
    func tumKisilerAl() {
        
        do {
            let liste = try context.fetch(KisilerModel.fetchRequest())
            anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        } catch {
            
        }
    }
    
    func kisiAra(aramaKelimesi: String) {
        do {
            let fr = KisilerModel.fetchRequest()
            fr.predicate = NSPredicate(format: "kisi_ad CONTAINS %@", aramaKelimesi)
            let liste = try context.fetch(fr)
            anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        } catch {
            
        }
    }
    
    func kisiSil(kisi: KisilerModel) {
        context.delete(kisi)
        appDelegate.saveContext()
        tumKisilerAl()
    }
}
