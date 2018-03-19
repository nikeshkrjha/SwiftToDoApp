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
        //        Alamofire.request(ApiConstants.BaseURL).responseJSON { response in
        //            print("Request: \(String(describing: response.request))")   // original url request
        //            print("Response: \(String(describing: response.response))") // http url response
        //            print("Result: \(response.result)")                         // response serialization result
        //
        //            if let json = response.result.value {
        //                print("JSON: \(json)") // serialized json response
        //            }
        //
        //            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
        //                print("Data: \(utf8Text)") // original server data as UTF8 string
        //            }
        //        }
        
        
        //        Alamofire.request(ApiConstants.BaseURL).responseObject { (response: DataResponse<TodoItem>) in
        //            let todos: TodoItem = response.data
        //            debugPrint(String(data: todos, encoding: .utf8))
        //        }
        
        
        let URL = ApiConstants.BaseURL
        Alamofire.request(URL).responseArray { (response: DataResponse<[TodoItem]>) in
            //            debugPrint(String(data: response.data!, encoding: .utf8))
            debugPrint(response.result.value?.toJSON())
            
        }
        
        
    }
    
    
    static func getTodoItemsList(completion: @escaping(Bool, [TodoItem?]) -> Void){
        let URL = ApiConstants.BaseURL
        ProgressHud.showProgressHUDWtih(message: "Loading data...")
        Alamofire.request(URL).responseArray { (response: DataResponse<[TodoItem]>) in
            //            debugPrint(String(data: response.data!, encoding: .utf8))
            debugPrint(response.result.value?.toJSON())
            completion(true,response.result.value!)
            
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
//        SVProgressHUD.setForegroundColor(ThemeManager.color(.themeBlue))
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

