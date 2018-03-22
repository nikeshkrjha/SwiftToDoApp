//
//  CreateTodoViewController.swift
//  MyTodoApp
//
//  Created by Nikesh Jha on 3/20/18.
//  Copyright © 2018 Nikesh Jha. All rights reserved.
//

import UIKit


protocol CreateTodoProtocol {
    func reloadData()
}

class CreateTodoViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var todoTextView: UITextView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var createTodoProtcol: CreateTodoProtocol?
    
    //MARK:- ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        containerView.layer.cornerRadius = 5
        todoTextView.layer.cornerRadius = 5
        todoTextView.layer.borderColor = UIColor.lightGray.cgColor
        todoTextView.layer.borderWidth = 1
        cancelBtn.layer.cornerRadius = 15
        saveBtn.layer.cornerRadius = 15
        saveBtn.backgroundColor = UIColor.hexStringToUIColor(hex: ColorConstants.ThemeColor)
        cancelBtn.backgroundColor = UIColor.hexStringToUIColor(hex: ColorConstants.ThemeColor)
    }
    
    
    //MARK:- IBAction methods
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTodoItem(_ sender: Any) {
        var itemDict: [String: Any] = [:]
        itemDict["title"] = todoTextView.text!
        itemDict["completed"] = false
        ApiHandler.createTodo(itemDict: itemDict) { (success, data) in
            debugPrint(data.debugDescription)
            if success{
                self.createTodoProtcol?.reloadData()
            }else{
                ProgressHud.showError(errorString: "Something went wrong")
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
