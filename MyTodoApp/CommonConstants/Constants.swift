//
//  Constants.swift
//  MyTodoApp
//
//  Created by Nikesh Jha on 3/19/18.
//  Copyright © 2018 Nikesh Jha. All rights reserved.
//

import Foundation
import UIKit

struct ApiConstants {
    static let BaseURL: String = "http://reactlara.herokuapp.com/api/"
    static let todosList: String = "todos"
    static let UpdateTodoURL = "https://jsonplaceholder.typicode.com/todos/"
    static let createTodoURL = "user/1/todo"
}


struct StoryboardIdentifiers{
    static let TodoListCell = "TodoTableViewCell"
    static let TodoDetailsVC = "TodoDetailsViewController"
    static let CreateTodoVC = "CreateTodoViewController"
}


struct ColorConstants {
    static let ThemeColor = "#2E7D32"
}

extension UIColor {
    static func hexStringToUIColor (hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
