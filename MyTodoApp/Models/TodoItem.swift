//
//  TodoItem.swift
//  MyTodoApp
//
//  Created by Nikesh Jha on 3/19/18.
//  Copyright © 2018 Nikesh Jha. All rights reserved.
//

import UIKit
import ObjectMapper

class TodoItem: Mappable {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool = false
    
    
    convenience init(){
        self.init()
    }
    
    struct SerializationKeys{
        static var userId = "user_id"
        static var id = "id"
        static var title = "title"
        static var completed = "completed"
    }
    
    func mapping(map: Map) {
        userId <- map[SerializationKeys.userId]
        id <- map[SerializationKeys.id]
        title <- map[SerializationKeys.title]
        completed <- map[SerializationKeys.completed]
    }
    
    required init?(map: Map){
        
    }
    
    
}
