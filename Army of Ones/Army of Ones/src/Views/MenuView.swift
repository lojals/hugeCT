//
//  MenuView.swift
//  Army of Ones
//
//  Created by Jorge Raul Ovalle Zuleta on 5/5/15.
//  Copyright (c) 2015 Jorge R Ovalle Z. All rights reserved.
//

import UIKit

class MenuView: GenericView {
    
    override func viewDidAppear(animated: Bool) {
        APIManagerClass.getCurrencies()
    }
    
    override func returnObt(responseObject: AnyObject) {
        for currency in ((responseObject as! NSDictionary)["rates"]! as! NSDictionary){
            println(currency.value as! CGFloat)
        }
        
    }
}
