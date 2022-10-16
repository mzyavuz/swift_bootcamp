//
//  DetailPageRouter.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import Foundation

class TodoDetailRouter: PresenterToRouterTodoDetailProtocol {
    static func createModule(ref: UpdateToDoVC) {
        ref.todoDetailPresenterObject = TodoDetailPresenter()
        ref.todoDetailPresenterObject?.todoDetailInteractor = TodoDetailInteractor()
    }
}
