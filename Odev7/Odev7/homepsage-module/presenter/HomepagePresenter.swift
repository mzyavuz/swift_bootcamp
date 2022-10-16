//
//  HomepagePresenter.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import Foundation

class HomepagePresenter: ViewToPresenterHomepageProtocol {
    var homepageInteractor: PresenterToInteractorHomepageProtocol?
    var homepageView: PresenterToViewHomepageProtocol?
    
    func uploadTodos() {
        homepageInteractor?.uploadAllTodos()
    }
    
    func search(searchText: String) {
        homepageInteractor?.searchTodo(searchText: searchText)
    }
    
    func delete(todo_id: Int) {
        homepageInteractor?.deleteTodo(todo_id: todo_id)
    }
}


extension HomepagePresenter: InteractorToPresenterHomepageProtocol {
    func sendDataToPresenter(toDosList: [ToDo]) {
        homepageView?.sendDataToView(toDosList: toDosList)
    }
}
