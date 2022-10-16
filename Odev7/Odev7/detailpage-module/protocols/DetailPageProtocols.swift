//
//  DetailPageProtocols.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import Foundation

protocol ViewToPresenterTodoDetailProtocol {
    var todoDetailInteractor: PresenterToInteractorTodoDetailProtocol? {get set}
    
    func update(todo_id: Int, todo_name: String)
}

protocol PresenterToInteractorTodoDetailProtocol {
    func updateTodo(todo_id: Int, todo_name: String)
}

protocol PresenterToRouterTodoDetailProtocol {
    static func createModule(ref: UpdateToDoVC)
}
