//
//  HomepageProtocols.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import Foundation

protocol ViewToPresenterHomepageProtocol {
    var homepageInteractor: PresenterToInteractorHomepageProtocol? { get set }
    var homepageView: PresenterToViewHomepageProtocol? {get set}

    func uploadTodos()
    func search(searchText: String)
    func delete(todo_id: Int)
}

protocol PresenterToInteractorHomepageProtocol {
    var homepagePresenter: InteractorToPresenterHomepageProtocol? {get set}
    
    func uploadAllTodos()
    func searchTodo(searchText: String)
    func deleteTodo(todo_id: Int)
}

protocol InteractorToPresenterHomepageProtocol {
    func sendDataToPresenter(toDosList: [ToDo])
}

protocol PresenterToViewHomepageProtocol {
    func sendDataToView(toDosList: [ToDo])
}

protocol PresenterToRouterHomepageProtocol {
    static func createModule(ref: HomepageVC)
}
