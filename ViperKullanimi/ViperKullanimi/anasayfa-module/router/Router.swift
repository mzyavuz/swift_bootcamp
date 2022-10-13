//
//  router.swift
//  ViperKullanimi
//
//  Created by M.Zeynep Cakmakci on 6.10.2022.
//

import Foundation

class Router: PresenterToRouterProtocol {
    static func createModule(ref: ViewController) {
        let presenter = Presenter()
        
        //View Katmanı değişkeni
        ref.presenterNesnesi = presenter
        
        //Presenter katmanı değişkeni
        ref.presenterNesnesi?.interactor = Interactor()
        ref.presenterNesnesi?.view = ref
        
        // Interactor katmanı değişkeni
        ref.presenterNesnesi?.interactor?.presenter = presenter
    }
}
