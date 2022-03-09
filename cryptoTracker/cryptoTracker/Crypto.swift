//
//  Crypto.swift
//  cryptoTracker
//
//  Created by Olisa Johnny Chukwu on 3/7/22.
//

import Foundation

struct Crypto:Codable{
    let symbol:String
    let name:String
    let id:String
    let price:Double
    let market:Double
    let priceChange:Double
    let image:String
    let totalVolume:Double
    let marketRank:Int
    let ath:Double
    let _24h:Double
    let _1hr:Double
    let _7d:Double
    let athCh:Double
    
    
    
    
    enum CodingKeys:String,CodingKey{
        case symbol
        case name
        case id
        case price="current_price"
        case market="market_cap"
        case priceChange="price_change_percentage_24h"
        case image
        case totalVolume="total_volume"
        case marketRank="market_cap_rank"
        case ath="ath"
        case _24h="price_change_percentage_24h_in_currency"
        case _1hr="price_change_percentage_1h_in_currency"
        case _7d="price_change_percentage_7d_in_currency"
        case athCh = "ath_change_percentage"
         
    }
    
    
//    "price_change_percentage_1h_in_currency": -0.3861391164778965,
//        "price_change_percentage_24h_in_currency": -1.0885293679093861,
//        "price_change_percentage_7d_in_currency": 0.5844374289393739
    
//    "ath_change_percentage": -44.53584,
    
    
    
    
    

    
    
    
    
}
