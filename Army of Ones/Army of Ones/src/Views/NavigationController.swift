//
//  NavigationController.swift
//  Army of Ones
//
//  Created by Jorge Raul Ovalle Zuleta on 5/6/15.
//  Copyright (c) 2015 Jorge R Ovalle Z. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.titleTextAttributes = [NSFontAttributeName:UIFont.flatFontOfSize(18),NSForegroundColorAttributeName: UIColor.whiteColor()]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
