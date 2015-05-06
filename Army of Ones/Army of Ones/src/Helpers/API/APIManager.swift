//
//  APIManager.swift
//
//
//  Created by Jorge Raul Ovalle Zuleta on 2015.
//

import UIKit

@objc protocol APIManagerDelegate{
    optional func returnList(responseObject:AnyObject, url:String)
    optional func returnObt(responseObject:AnyObject)
}

class APIManager: NSObject {
    var URLAPI = "http://api.fixer.io/"
    var delegate:APIManagerDelegate!
    
    override init() {
        super.init()
    }
    
    //MARK: -CUSTOM METHODS
    func getCurrencies(){
        //http://api.fixer.io/latest?base=USD&symbols=EUR,GBP,JPY,BRL
        performGet("latest?base=USD&symbols=EUR,GBP,JPY,BRL", token: "", list: false)
    }
    
    func getLastDays(){
        //http://api.fixer.io/2015-01-04?base=USD&symbols=EUR,GBP,JPY,BRL
        performGet("latest?base=USD&symbols=EUR,GBP,JPY,BRL", token: "", list: false)
    }
    
    
    //MARK: -AFNETWORKING DELEGATE
    func performGet(url:String!, token:String!, list:Bool){
        var operationManager = AFHTTPRequestOperationManager()
        operationManager.responseSerializer = AFJSONResponseSerializer()
        operationManager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
        operationManager.GET(URLAPI+url, parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                if list{
                    self.delegate.returnList!(responseObject, url: "url")
                }else{
                    self.delegate.returnObt!(responseObject)
                }
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
    }
    
}
