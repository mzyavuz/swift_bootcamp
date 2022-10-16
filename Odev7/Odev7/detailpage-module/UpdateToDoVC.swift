//
//  UpdateToDoVC.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 15.10.2022.
//

import UIKit

class UpdateToDoVC: UIViewController {
    
    @IBOutlet weak var tfToDoName: UITextField!
    
    var todo: ToDo?
    
    var todoDetailPresenterObject: ViewToPresenterTodoDetailProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TodoDetailRouter.createModule(ref: self)
        
        if let t = todo {
            tfToDoName.text = t.todo_name
        }
        
        
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if let tn = tfToDoName.text, let t = todo {
            todoDetailPresenterObject?.update(todo_id: t.todo_id!, todo_name: tn)
        }
    }
    
}
