//
//  AddToDoVC.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 15.10.2022.
//

import UIKit

class AddToDoVC: UIViewController {

    @IBOutlet weak var tfNewToDoName: UITextField!
    
    var addTodoPresenterObject: ViewToPresenterAddingPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AddingPageRouter.createModule(ref: self)
    }

    @IBAction func addButton(_ sender: Any) {
        if let tn = tfNewToDoName.text {
            addTodoPresenterObject?.add(todo_name: tn)
        }
    }
}
