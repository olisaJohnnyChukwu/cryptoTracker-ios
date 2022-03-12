//
//  User.swift
//  cryptoTracker
//
//  Created by Olisa Johnny Chukwu on 3/10/22.
//

import Foundation



class User{
    var portfolio:[Crypto:Double]=[:]
    
    func addToHolding(_ crypto:Crypto,_ quantity:Double){
        
        if let current = portfolio[crypto]{
            portfolio[crypto]=current+quantity
            
        }else{
            portfolio[crypto]=quantity
        }
    }
    
    
    func reduceHolding(_ crypto:Crypto,_ quantity:Double){
        if let current = portfolio[crypto]{
            portfolio[crypto]=current-quantity
            
        }
        
        
    }
    
    func owns(_ crypto:Crypto)->Bool{
       
       return portfolio[crypto] != nil
    }
    
    func currentHolding(_ crypto:Crypto)->Double{
        
        if let current = portfolio[crypto]{
            
            return current
        }
        return 0
    }
    
    
    func getHolding()->[Crypto]{
        
        return portfolio.keys.filter{
            portfolio[$0]!>0
        }
        
    }
    
    
    func getQuantity(_ crypto:Crypto)->Double{
        
        guard let qauntity = portfolio[crypto] else {return 0}
        return qauntity
    }
    
    
    
    
    
    
                 
    
    
    
    
    
    
}


