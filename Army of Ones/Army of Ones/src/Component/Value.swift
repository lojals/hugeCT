//
//  Value.swift
//  Army of Ones
//
//  Created by Jorge Raul Ovalle Zuleta on 5/6/15.
//  Copyright (c) 2015 Jorge R Ovalle Z. All rights reserved.
//

import UIKit

class Value: UIView {
    var imgFlag      :UIImageView!
    var lblCurrency  :UILabel!
    var lblValue     :UILabel!

    /**
    Method ot initialize this component
    
    :param: frame    Size and position of the layer
    :param: currency Name of the currency that will be show
    :param: value    Value to make some operations
    
    :returns: nil
    */
    init(frame: CGRect, currency: String, value: CGFloat) {
        super.init(frame: frame)
        
        imgFlag                     = UIImageView(frame: CGRectMake(0, 0, frame.width*0.15, frame.height))
        imgFlag.backgroundColor     = UIColor.nephritisColor().colorWithAlphaComponent(0.8)
        imgFlag.image               = UIImage(named: currency)
        imgFlag.contentMode         = UIViewContentMode.Center
        self.addSubview(imgFlag)
        
        lblCurrency                 = UILabel(frame: CGRectMake(imgFlag.frame.maxX, 0, frame.width*0.25, frame.height))
        lblCurrency.backgroundColor = UIColor.nephritisColor().colorWithAlphaComponent(0.6)
        lblCurrency.text            = currency
        lblCurrency.textColor       = UIColor.cloudsColor()
        lblCurrency.font            = UIFont.lightFlatFontOfSize(25)
        lblCurrency.textAlignment   = NSTextAlignment.Center
        self.addSubview(lblCurrency)
        
        lblValue                    = UILabel(frame: CGRectMake(lblCurrency.frame.maxX, 0, frame.width*0.6, frame.height))
        lblValue.backgroundColor    = UIColor.nephritisColor().colorWithAlphaComponent(0.4)
        lblValue.text               = "\(value)"
        lblValue.textColor          = UIColor.cloudsColor()
        lblValue.font               = UIFont.lightFlatFontOfSize(25)
        lblValue.textAlignment      = NSTextAlignment.Center
        self.addSubview(lblValue)
        
        self.layer.cornerRadius     = 10
        self.layer.masksToBounds    = true
    }

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    