//
//  ApiHandler.swift
//  MyTodoApp
//
//  Created by Nikesh Jha on 3/19/18.
//  Copyright © 2018 Nikesh Jha. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import SVProgressHUD

class ApiHandler {
    
    static func getTodos(){
        let URL = ApiConstants.BaseURL
        Alamofire.request(URL).responseArray { (response: DataResponse<[TodoItem]>) in
            debugPrint(response.result.value?.toJSON())
        }
    }
    
    
    static func getTodoItemsList(completion: @escaping(Bool, [TodoItem?]) -> Void){
        let URL = ApiConstants.BaseURL + ApiConstants.todosList
        ProgressHud.showProgressHUDWtih(message: "Loading data...")
        Alamofire.request(URL).responseArray { (response: DataResponse<[TodoItem]>) in
            debugPrint("URL:  \(URL)")
            debugPrint(response.result.value?.toJSON())
            completion(true,response.result.value!)
        }
    }
    
    
    static func createTodo(itemDict: [String: Any], completion: @escaping(Bool, Data?) -> Void){
        let URL = ApiConstants.BaseURL + ApiConstants.createTodoURL
        let parameters = ["title": itemDict["title"], "completed": itemDict["completed"]] as! [String : Any]
        let headers = ["Content-type": "application/json"]
        
        Alamofire.request(URL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers ).response { (response) in
            debugPrint(response)
            debugPrint(response.data?.description)
            if response.error == nil {
                completion(true, response.data)
            }
        }
        
//        Alamofire.request(URL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers ).responseJSON { (response) in
//            debugPrint(response)
//        }
        
    }
    
    static func updateTodoItem(item: TodoItem, completion: @escaping(Bool, TodoItem?) -> Void){
        let URL = ApiConstants.UpdateTodoURL + "\(item.id!)"
        let parameters = ["id": item.id!, "title": item.title!, "userId": item.userId!, "completed": true] as [String : Any]
        let headers = ["Content-type": "application/json; charset=UTF-8"]
        debugPrint(parameters)
        debugPrint(headers)
        
        Alamofire.request(URL, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers ).response { (response) in
            debugPrint(response.data?.description)
            completion(true, nil)
        }
        
    }
}



//MARK:- Loading View customization
class ProgressHud: NSObject {
    class func showProgressHUDWtih(message: String){
        var lMessage = "Loading..."
        if !message.isEmpty {
            lMessage = message
        }
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setBackgroundColor (.clear)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setRingNoTextRadius(20)
        SVProgressHUD.setRingThickness(3)
        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.show(withStatus: lMessage)
    }
    
    class func hideProgressHUD(){
        SVProgressHUD.dismiss()
    }
    
    class func showSuccess(successString: String){
        SVProgressHUD.setBackgroundColor (UIColor.white)
        SVProgressHUD.showSuccess(withStatus: successString)
        SVProgressHUD.dismiss(withDelay: 3)
    }
    
    class func showError(errorString: String?){
        SVProgressHUD.setBackgroundColor (UIColor.white)
        SVProgressHUD.showError(withStatus: errorString ?? "")
        SVProgressHUD.dismiss(withDelay: 3)
    }
}

