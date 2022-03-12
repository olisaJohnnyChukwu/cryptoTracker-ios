//
//  Order.swift
//  cryptoTracker
//
//  Created by Olisa Johnny Chukwu on 3/10/22.
//

import Foundation


struct Order:CustomStringConvertible{
    var description: String{
        return " Quantity: \(quantity) \n Price: \(price) \n Type:\(type) \n Date: "+dateFormatter.string(from:date)
        }
    
    var name:String
    var quantity:Double
    var price:Double
    var date:Date=Date()
    let dateFormatter = DateFormatter()
    var type:OrderType

   

    
    init(name:String,quantity:Double,price:Double,type:OrderType){
        
        self.name=name
        self.quantity=quantity
        self.price=price
        self.type=type
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    }
    
}



enum OrderType:String{
    case buy="Buy"
    case sell="Sell"
    case withdraw="Withdraw"
    case deposit="Deposit"
}


