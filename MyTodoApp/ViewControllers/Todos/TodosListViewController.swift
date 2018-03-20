//
//  ViewController.swift
//  MyTodoApp
//
//  Created by Nikesh Jha on 3/12/18.
//  Copyright © 2018 Nikesh Jha. All rights reserved.
//

import UIKit

class TodosListViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var addNewTodoBtn: UIBarButtonItem!
    
    //MARK:- Data for tableView
    var todoListItems: [TodoItem] = []
    
    //MARK:- ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
    
    
    @IBAction func addNewTodoItem(_ sender: Any) {
        let storyboard  = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: StoryboardIdentifiers.CreateTodoVC)
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion:nil)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = todoListItems[indexPath.row]
        
        //navigate to the details view
        let detailsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: StoryboardIdentifiers.TodoDetailsVC) as! TodoDetailsViewController
        detailsController.todoItem = selectedItem
        self.navigationController?.pushViewController(detailsController, animated: true)
        
    }
    
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // remove the item from the data model
            todoListItems.remove(at: indexPath.row)
            
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }
}

