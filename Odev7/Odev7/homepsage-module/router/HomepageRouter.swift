//
//  AnasayfaRouter.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import Foundation

class HomepageRouter: PresenterToRouterHomepageProtocol {
    static func createModule(ref: HomepageVC) {
        let presenter = HomepagePresenter()
        
        ref.homepagePresenterObject = presenter
        
        ref.homepagePresenterObject?.homepageInteractor = HomepageInteractor()
        ref.homepagePresenterObject?.homepageView = ref
        
        ref.homepagePresenterObject?.homepageInteractor?.homepagePresenter = presenter
    }
}
