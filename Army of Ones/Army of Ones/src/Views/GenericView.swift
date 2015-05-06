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
    
    override func viewDidLoad() {
        APIManagerClass = APIManager()
        APIManagerClass.delegate = self
    }
    
    func returnObt(responseObject: AnyObject) {}
    
    
}
