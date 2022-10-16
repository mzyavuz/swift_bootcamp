//
//  DetailPagePresenter.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import Foundation

class TodoDetailPresenter: ViewToPresenterTodoDetailProtocol {
    var todoDetailInteractor: PresenterToInteractorTodoDetailProtocol?
    
    func update(todo_id: Int, todo_name: String) {
        todoDetailInteractor?.updateTodo(todo_id: todo_id, todo_name: todo_name)
    }
}
