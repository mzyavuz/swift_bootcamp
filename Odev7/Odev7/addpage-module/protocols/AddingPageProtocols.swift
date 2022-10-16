//
//  AddingPageProtocols.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import Foundation

protocol ViewToPresenterAddingPageProtocol {
    var addTodoInteractor: PresenterToInteractorAddingPageProtocol? {get set}
    
    func add(todo_name: String)
}

protocol PresenterToInteractorAddingPageProtocol {
    func addTodo(todo_name: String)
}

protocol PresenterToRouterAddingPageProtocol {
    static func createModule(ref: AddToDoVC)
}
