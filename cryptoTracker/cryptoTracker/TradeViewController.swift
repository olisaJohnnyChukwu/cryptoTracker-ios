//
//  TradeViewController.swift
//  cryptoTracker
//
//  Created by Olisa Johnny Chukwu on 3/9/22.
//

import UIKit

class TradeViewController: UIViewController {
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    
    @IBOutlet weak var priceTF: UITextField!
    
    
    @IBOutlet weak var quantityTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    var crypto:Crypto?
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let crypto = crypto {
            setImage(image: crypto.image)
            name.text = crypto.name
            price.text="$ \(crypto.price)"
            balanceLabel.text="$ \(balance)"
            quantityTF.placeholder=crypto.symbol
        }
        
        
        
        
    }
    
    
    
    @IBAction func priceTextField(_ sender: UITextField) {
        
        guard let text = sender.text
        else {return}
        
        guard let order = Double(text)
        else{return}
        
        
        if let crypto = crypto {
            let convert=order/crypto.price
            quantityTF.text="\(convert)"
        }
        
        
        
        
        
        
        
    }
    
    
   
    @IBAction func quantityTextField(_ sender: UITextField) {
        guard let text = sender.text
        else {return}
        
        guard let order = Double(text)
        else{return}
        
        if let crypto = crypto {
            let convert=order*crypto.price
            priceTF.text="\(convert)"
        }
    }
    
    
    
    
    @IBAction func goBack(){
        dismiss(animated: true, completion: nil)
    }
    
    
    func setImage(image:String){
        if let data = try? Data(contentsOf:       URL(string:image)!){
            
            if let image=UIImage(data: data){
                
                self.image.image=image
                
            }
            
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
