//
//  AddingPagePresenter.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import Foundation

class AddingPagePresenter: ViewToPresenterAddingPageProtocol {
    var addTodoInteractor: PresenterToInteractorAddingPageProtocol?
    
    func add(todo_name: String) {
        addTodoInteractor?.addTodo(todo_name: todo_name)
    }
}
