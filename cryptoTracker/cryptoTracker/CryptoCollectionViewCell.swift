//
//  CryptoCollectionViewCell.swift
//  cryptoTracker
//
//  Created by Olisa Johnny Chukwu on 3/12/22.
//

import UIKit

class CryptoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
   
    
    @IBOutlet weak var priceCh: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    
    func configure(crypto:Crypto){
        
        name.text = crypto.name
        price.text="$" + String(format: "%.2f",crypto.price)
        setImage(image: crypto.image)
        priceCh.text = String(format: "%.2f",crypto.priceChange)+"%"
        
        
    }
    
    
    func setImage(image:String){
        if let data = try? Data(contentsOf:       URL(string:image)!){
            
            if let image=UIImage(data: data){
                
                self.image.image=image
                
            }
            
            
        }
    }
    

    
    
    
    
  
    
    
    

    
    
}
