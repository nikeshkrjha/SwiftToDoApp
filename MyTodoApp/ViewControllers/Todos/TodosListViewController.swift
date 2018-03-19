//
//  ViewController.swift
//  MyTodoApp
//
//  Created by Nikesh Jha on 3/12/18.
//  Copyright © 2018 Nikesh Jha. All rights reserved.
//

import UIKit

class TodosListViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var todoTableView: UITableView!
    
    //MARK:- Data for tableView
    var todoListItems: [TodoItem] = []
    
    //MARK:- ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        todoTableView.delegate = self
        todoTableView.dataSource = self
        prepareData()
    }
    
    func prepareData(){
        ApiHandler.getTodoItemsList { (success, todoItems) in
            debugPrint(todoItems)
            if !todoItems.isEmpty{
                ProgressHud.hideProgressHUD()
                self.todoListItems = todoItems as! [TodoItem]
                self.todoTableView.reloadData()
            }
        }
    }
}



//MARK:- UITableView datasource and delegate methods
extension TodosListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifiers.TodoListCell , for: indexPath) as! TodoTableViewCell
        let item = todoListItems[indexPath.row]
        cell.todoTitleLbl.text = item.title
        if item.completed{
            cell.todoCheckBtn.setImage(UIImage(named: "CheckedCheckbox"), for: .normal)
        }else{
            cell.todoCheckBtn.setImage(UIImage(named: "UncheckedCheckbox"), for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

