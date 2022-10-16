//
//  AddingPageInteractor.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import Foundation

class AddingPageInteractor: PresenterToInteractorAddingPageProtocol {
    let db: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyTo = URL(fileURLWithPath: targetPath).appendingPathComponent("ToDos.sqlite")
        
        db = FMDatabase(path: copyTo.path)
    }
    
    func addTodo(todo_name: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO todos (todo_name) VALUES (?)", values: [todo_name])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
