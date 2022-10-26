//
//  SepetRouter.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import Foundation

class SepetRouter: PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetVC) {
        let presenter = SepetPresenter()
        
        ref.sepetPresenterNesnesi = presenter
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterNesnesi?.sepetView = ref
        
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
    }
    
    
}
