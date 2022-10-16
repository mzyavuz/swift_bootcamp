//
//  HomepageInteractor.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import Foundation

class HomepageInteractor: PresenterToInteractorHomepageProtocol {
    var homepagePresenter: InteractorToPresenterHomepageProtocol?
    
    let db: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyTo = URL(fileURLWithPath: targetPath).appendingPathComponent("ToDos.sqlite")
        
        db = FMDatabase(path: copyTo.path)
    }
    
    func uploadAllTodos() {
        var list = [ToDo]()
        
        db?.open()
        
        do {
            let r = try db!.executeQuery("SELECT * FROM todos", values: nil)
            
            while r.next() {
                let todo = ToDo(todo_id: Int(r.string(forColumn: "todo_id"))!, todo_name: r.string(forColumn: "todo_name")!)
                
                list.append(todo)
            }
            homepagePresenter?.sendDataToPresenter(toDosList: list)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func searchTodo(searchText: String) {
        var list = [ToDo]()
        
        db?.open()
        
        do {
            let r = try db!.executeQuery("SELECT * FROM todos WHERE todo_name like '%\(searchText)%'", values: nil)
            
            while r.next() {
                let todo = ToDo(todo_id: Int(r.string(forColumn: "todo_id"))!, todo_name: r.string(forColumn: "todo_name")!)
                
                list.append(todo)
            }
            homepagePresenter?.sendDataToPresenter(toDosList: list)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func deleteTodo(todo_id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM todos WHERE todo_id = ?", values: [todo_id])
            uploadAllTodos()
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
