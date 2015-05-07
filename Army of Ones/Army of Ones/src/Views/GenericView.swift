//
//  GenericView.swift
//  Army of Ones
//
//  Created by Jorge Raul Ovalle Zuleta on 5/5/15.
//  Copyright (c) 2015 Jorge R Ovalle Z. All rights reserved.
//

import UIKit

class GenericView: UIViewController,APIManagerDelegate {
    var APIManagerClass:APIManager!
    
    /**
    Initializer of the Generic View, setting some basics of the UI
    */
    override func viewDidLoad() {
        APIManagerClass          = APIManager()
        APIManagerClass.delegate = self
        view.backgroundColor     = UIColor.emerlandColor()
        self.navigationController?.navigationBar.configureFlatNavigationBarWithColor(UIColor.nephritisColor())
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func returnObt(responseObject: AnyObject) {}
    
    
}
