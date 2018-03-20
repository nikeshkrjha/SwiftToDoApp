//
//  BaseViewController.swift
//  MyTodoApp
//
//  Created by Nikesh Jha on 3/20/18.
//  Copyright © 2018 Nikesh Jha. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: ColorConstants.ThemeColor)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
