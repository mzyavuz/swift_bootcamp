//
//  DetailPageInteractor.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import Foundation

class TodoDetailInteractor: PresenterToInteractorTodoDetailProtocol {
    let db: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyTo = URL(fileURLWithPath: targetPath).appendingPathComponent("ToDos.sqlite")
        
        db = FMDatabase(path: copyTo.path)
    }
    
    func updateTodo(todo_id: Int, todo_name: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE todos SET todo_name = ? WHERE todo_id = ?", values: [todo_name, todo_id])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
