//
//  MenuView.swift
//  Army of Ones
//
//  Created by Jorge Raul Ovalle Zuleta on 5/5/15.
//  Copyright (c) 2015 Jorge R Ovalle Z. All rights reserved.
//

import UIKit

class MenuView: GenericView {
    
    /// UI VARS
    var lblIntro:      UILabel!
    var txtBase:       FUITextField!
    var btnConvert:    FUIButton!
    var lblInstruct:   UILabel!
    var container:     UIView!
    var exgContainer:  UIView!
    
    // LOGIC VARS
    var convert:       Bool!
    var tapRecognizer: UITapGestureRecognizer!
    var currencies:    Dictionary<String,CGFloat>!
    
    /**
    Function to set all UI Components on the View
    
    :param: animated By default
    */
    override func viewWillAppear(animated: Bool) {
        title = "Currency converter".uppercaseString
        
        container                   = UIView(frame: CGRectMake(0, 0, 320, 300))
        container.backgroundColor   = UIColor.nephritisColor()
        container.center            = view.center
        

        lblIntro                    = UILabel(frame: CGRectMake(0, 20, container.frame.width, 45))
        lblIntro.text               = "$"
        lblIntro.textAlignment      = NSTextAlignment.Center
        lblIntro.font               = UIFont.lightFlatFontOfSize(40)
        lblIntro.textColor          = UIColor.cloudsColor()

        
        lblInstruct                 = UILabel(frame: CGRectMake(0, lblIntro.frame.maxY + 20, 280, 50))
        lblInstruct.text            = "Write the amount of US Dollars you'd like to exchange"
        lblInstruct.center.x        = container.center.x
        lblInstruct.numberOfLines   = 0
        lblInstruct.textAlignment   = NSTextAlignment.Center
        lblInstruct.font            = UIFont.flatFontOfSize(18)
        lblInstruct.textColor       = UIColor.cloudsColor()

        
        txtBase                     = FUITextField(frame: CGRectMake(0, lblInstruct.frame.maxY + 10, 280, 50))
        txtBase.font                = UIFont.lightFlatFontOfSize(40)
        txtBase.backgroundColor     = UIColor.clearColor()
        txtBase.borderColor         = UIColor.alizarinColor()
        txtBase.textFieldColor      = UIColor.whiteColor()
        txtBase.edgeInsets          = UIEdgeInsetsMake(4.0, 15.0, 4.0, 15.0)
        txtBase.tintColor           = UIColor.emerlandColor()
        txtBase.textColor           = UIColor.wetAsphaltColor()
        txtBase.borderWidth         = 2.0
        txtBase.cornerRadius        = 3.0
        txtBase.textAlignment       = NSTextAlignment.Center
        txtBase.keyboardType        = UIKeyboardType.NumberPad
        txtBase.center.x            = container.center.x
        txtBase.placeholder         = "USD"

        
        btnConvert                  = FUIButton(frame: CGRectMake(0, txtBase.frame.maxY + 10, 80, 50))
        btnConvert.buttonColor      = UIColor.alizarinColor()
        btnConvert.shadowColor      = UIColor.pomegranateColor()
        btnConvert.shadowHeight     = 3.0
        btnConvert.cornerRadius     = 6.0
        
        
        btnConvert.titleLabel!.font = UIFont.boldFlatFontOfSize(15)
        btnConvert.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Normal)
        btnConvert.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Highlighted)
        btnConvert.setTitle("Convert", forState: UIControlState.Normal)
        btnConvert.addTarget(self, action: Selector("convertCurrency:"), forControlEvents: UIControlEvents.TouchUpInside)
        btnConvert.center.x = container.center.x
        
        
        tapRecognizer = UITapGestureRecognizer(target: self, action: Selector("hide"))
        self.view.addGestureRecognizer(tapRecognizer)
        
        
        view.addSubview(container)
        container.addSubview(lblIntro)
        container.addSubview(lblInstruct)
        container.addSubview(txtBase)
        container.addSubview(btnConvert)
        convert = true
    }
    
    /**
    Function that make the API call
    
    :param: animated By Default
    */
    override func viewDidAppear(animated: Bool) {
        APIManagerClass.getCurrencies()
    }
    
    /**
    Function to manage the interaction of the exchange
    
    :param: sender button that excecute the event
    */
    func convertCurrency(sender: AnyObject) {
        if validate(){
            var animation = POPSpringAnimation(propertyNamed: kPOPViewCenter)
            if convert! {
                convert = false
                animation.fromValue = NSValue(CGPoint:  view.center)
                animation.toValue = NSValue(CGPoint: CGPointMake(view.center.x, 80))
                btnConvert.setTitle("Back", forState: UIControlState.Normal)
                showValues()
                
            }
            else{
                convert = true
                animation.fromValue = NSValue(CGPoint:  CGPointMake(self.view.center.x, 80))
                animation.toValue = NSValue(CGPoint: self.view.center)
                btnConvert.setTitle("Convert", forState: UIControlState.Normal)
                hideValues()
            }
            container.pop_addAnimation(animation, forKey: "position")
        }else{
            var alert = UIAlertController(title: "Error", message: "Oops You should write the amount of dollars you want to exchange", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    /**
    Function charge to show the values after convertCurrency function is executed
    */
    func showValues(){
        exgContainer = UIView(frame: CGRectMake(0, 230, container.frame.width, self.view.frame.height - 230))
        exgContainer.alpha = 0
        self.view.addSubview(exgContainer)
        var counter = 0
        for currency in currencies{
            var hCurr = exgContainer.frame.height/4
            var rect = CGRectMake(0, (hCurr*CGFloat(counter)) + CGFloat(10), (exgContainer.frame.width - 32), hCurr - 20)
            var value = Value(frame: rect, currency: currency.0, value: currency.1 * CGFloat(txtBase.text!.toInt()!)  )
            value.center.x = exgContainer.center.x
            exgContainer.addSubview(value)
            counter++
        }
        var animate = POPSpringAnimation(propertyNamed: kPOPViewAlpha)
        animate.toValue = 1
        exgContainer.pop_addAnimation(animate, forKey: "CellAnimation")
    }
    
    func hideValues(){
        var animate = POPSpringAnimation(propertyNamed: kPOPViewAlpha)
        animate.toValue = 0
        exgContainer.pop_addAnimation(animate, forKey: "HideAnimation")
    }
    
    /**
    Function to hide the keyboard when background is tapped
    */
    func hide(){
        txtBase.resignFirstResponder()
    }
    
    /**
    Function to validate if the amount of Dollars is valid
    
    :returns: Boolean showing if it's valid or not
    */
    func validate()->Bool{
        if txtBase.text == ""{
            return false
        }else{
            return true
        }
    }
    
    /**
    Delegate function from APIManager
    
    :param: responseObject Response given by the API
    */
    override func returnObt(responseObject: AnyObject) {
        var d = JSON(responseObject as! NSDictionary)
        currencies = [String: CGFloat]()
        for currency in d["rates"]{
            currencies[currency.0] = CGFloat(currency.1.double ?? 0.0)
        }
    }
}
