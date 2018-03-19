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
    
    
    //MARK:- ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTableView.delegate = self
        todoTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}



//MARK:- UITableView datasource and delegate methods
extension TodosListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifiers.TodoListCell , for: indexPath) as! TodoTableViewCell
        return cell
    }
}

