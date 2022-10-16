//
//  ViewController.swift
//  Odev7
//
//  Created by M.Zeynep Cakmakci on 15.10.2022.
//

import UIKit

class HomepageVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toDoTableView: UITableView!
    
    var toDosList = [ToDo]()
    
    var homepagePresenterObject: ViewToPresenterHomepageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        copyDatabase()
        
        HomepageRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homepagePresenterObject?.uploadTodos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if  let todo = sender as? ToDo {
                let toVC = segue.destination as! UpdateToDoVC
                toVC.todo = todo
            }
        }
    }

    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "ToDos", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let copyTo = URL(fileURLWithPath: targetPath).appendingPathComponent("ToDos.sqlite")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: copyTo.path) {
            print("Database has already been copied")
        } else {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyTo.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}
extension HomepageVC: PresenterToViewHomepageProtocol {
    func sendDataToView(toDosList: [ToDo]) {
        self.toDosList = toDosList
        self.toDoTableView.reloadData()
    }
}

extension HomepageVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homepagePresenterObject?.search(searchText: searchText)
    }
}

extension HomepageVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = toDosList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! ToDoTableViewCell
        cell.todoLabel.text = todo.todo_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = toDosList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: todo)
        print("\(todo.todo_name!) is selected")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (contexualAction , view, bool) in
            let todo = self.toDosList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete Action", message: "Do you want to delete \(todo.todo_name!) ?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) {
                action in
                self.homepagePresenterObject?.delete(todo_id: todo.todo_id!)
            }
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
