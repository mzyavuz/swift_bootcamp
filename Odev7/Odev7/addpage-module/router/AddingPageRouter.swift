//
//  AddingPageRouter.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import Foundation

class AddingPageRouter: PresenterToRouterAddingPageProtocol {
    static func createModule(ref: AddToDoVC) {
        ref.addTodoPresenterObject = AddingPagePresenter()
        ref.addTodoPresenterObject?.addTodoInteractor = AddingPageInteractor()
    }
}
