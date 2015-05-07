//
//  CurrencyTransactions.swift
//  Army of Ones
//
//  Created by Jorge Raul Ovalle Zuleta on 5/7/15.
//  Copyright (c) 2015 Jorge R Ovalle Z. All rights reserved.
//

import UIKit

class CurrencyTransactions: NSObject {
    func convert(currency: CGFloat, amount:CGFloat) -> CGFloat{
        return currency*amount
    }
}
