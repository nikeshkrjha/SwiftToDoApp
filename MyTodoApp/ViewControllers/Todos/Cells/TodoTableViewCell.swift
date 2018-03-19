//
//  TodoTableViewCell.swift
//  MyTodoApp
//
//  Created by Nikesh Jha on 3/19/18.
//  Copyright © 2018 Nikesh Jha. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var todoCheckBtn: UIButton!
    @IBOutlet weak var todoTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    
    @IBAction func didChangeTodo(_ sender: Any) {
        
    }
    
}
