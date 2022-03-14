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
    
    @IBOutlet weak var tradePrice: UILabel!
    
    @IBOutlet weak var priceTF: UITextField!
    
    
    @IBOutlet weak var balanceInCoin: UILabel!
    
    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBOutlet weak var quantityTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    var crypto:Crypto?
    
    
    
    var setCoinBalance={
        (coin:Crypto,label:UILabel) in
        if (user.owns(coin)){
            label.text=coin.symbol+" "+String(format: "%.2f",user.currentHolding(coin))
        }
                                              
                                              
    }
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let crypto = crypto {
            setImage(image: crypto.image)
            name.text = crypto.name
            price.text="$ \(crypto.price)"
            balanceLabel.text="$ \(balance)"
            quantityTF.placeholder=crypto.symbol
            setCoinBalance(crypto,balanceInCoin)
        }
    }
    
    
    
    @IBAction func submitTrade(_ sender: UIButton) {
        
//        let quantityInString = quantityTF.text
//        let priceInString = priceTF.text
        guard let quantityInString = quantityTF.text
        else{
            return
        }
        guard let priceInString = priceTF.text
        else{
            return
        }
        guard let quantity = Double(quantityInString)
        else {
            return
        }
        guard let cost = Double(priceInString)
        else {
            return
        }
        
        
        guard let name = crypto?.name
        else {
            return
        }
        
        
        var order:Order
        
        if segControl.selectedSegmentIndex==0{
            
            order = Order(name:name,quantity: quantity, price: cost,type: .buy)
            if(order.price>balance){
                failurePopup(order)
                return
            }
            
            successpupUp(order,buy)
            
        }else{
            order = Order(name:name,quantity: quantity, price: cost,type: .sell)
            if user.currentHolding(crypto!)<quantity{
                failurePopup(order)
            }
    
            successpupUp(order, sell)
        }
        
        
    }
    
    
    
    
    
    
    
    func buy(_ order:Order){
        balance -= order.price
        orders.append(order)
        balanceLabel.text="$ \(balance)"
        user.addToHolding(crypto!, order.quantity)
        setCoinBalance(crypto!,balanceInCoin)
        
    }
    
    
    
    
    
    func  sell(_ order:Order){
        balance -= order.price
        orders.append(order)
        balanceLabel.text="$ \(balance)"
        user.reduceHolding(crypto!, order.quantity)
        setCoinBalance(crypto!,balanceInCoin)
        
    }
    
    
    func failurePopup(_ order:Order){
        
        let alert:UIAlertController = UIAlertController(title:"Transaction Failed", message: "INSUFFICIENT BALANCE \n"+order.description, preferredStyle: .alert)
        let action1=UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action1)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    func successpupUp(_ order:Order,_ call:@escaping (Order)->Void){
        
        let alert:UIAlertController = UIAlertController(title:"Review Order", message: order.description, preferredStyle: .alert)
        
        
        let action1=UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let action2=UIAlertAction(title: "OK", style: .default) {
            (action) in call(order)
        }
        alert.addAction(action1)
        alert.addAction(action2)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    @IBAction func priceTextField(_ sender: UITextField) {
        
        guard let text = sender.text
        else {return}
        
        guard let order = Double(text)
        else{return}
        
        
        if let crypto = crypto {
            let convert=order/crypto.price
            quantityTF.text=String(format: "%.2f",convert)
            setPrice(tradeprice: order)
        }
        
    }
    
    
    func setPrice(tradeprice:Double){
        tradePrice.text=String(format: "%.2f", tradeprice)
    }
    
    
   
    @IBAction func quantityTextField(_ sender: UITextField) {
        guard let text = sender.text
        else {return}
        
        guard let order = Double(text)
        else{return}
        
        
        
        if let crypto = crypto {
            let convert=order*crypto.price
            priceTF.text=String(format: "%.2f",convert)
            setPrice(tradeprice: convert)
            
        }
    }
    
    
    
    @IBAction func returnToPrevious(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
        var top:UIViewController = self
        
        while top.presentingViewController != nil {
            top = top.presentingViewController!
            
        }
        
        top.dismiss(animated: true, completion: nil)
        
        
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
