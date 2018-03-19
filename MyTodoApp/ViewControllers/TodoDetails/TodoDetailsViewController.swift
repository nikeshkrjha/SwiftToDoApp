//
//  TodoDetailsViewController.swift
//  MyTodoApp
//
//  Created by Nikesh Jha on 3/19/18.
//  Copyright © 2018 Nikesh Jha. All rights reserved.
//

import UIKit

class TodoDetailsViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var todoDetailsTxtField: UITextView!
    @IBOutlet weak var updateBtn: UIButton!
    
    var todoItem: TodoItem?
    //MARK:- ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUI()
        todoDetailsTxtField.text = todoItem?.title!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    //MARK:- Setup UI
    func setupUI(){
        todoDetailsTxtField.layer.borderColor = UIColor.darkGray.cgColor
        todoDetailsTxtField.layer.borderWidth = 2
        todoDetailsTxtField.layer.cornerRadius = 5
    }
    
    
    //MARK:- IBAction methods
    @IBAction func updateTodoItem(_ sender: Any) {
        todoItem?.title = todoDetailsTxtField.text!
        ApiHandler.updateTodoItem(item: todoItem!) { (success, todoItemResponse) in
            debugPrint(todoItemResponse)
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
}
