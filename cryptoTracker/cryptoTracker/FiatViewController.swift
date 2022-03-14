//
//  FiatViewController.swift
//  cryptoTracker
//
//  Created by Olisa Johnny Chukwu on 3/12/22.
//

import UIKit

class FiatViewController: UIViewController {

    
    
    
    @IBOutlet weak var segControl: UISegmentedControl!
    
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func submitOrder(_ sender: UITextField) {
        let index=segControl.selectedSegmentIndex
        
            
            guard let text = textField.text else { return}
            
            guard let amount = Double(text) else {return}
            
            var order:Order
            
            
            if(index == 0)
            {
                order=Order(name: OrderType.deposit.rawValue, quantity: amount, price: amount, type: .deposit)
                
                successpupUp(order, completeTransaction)
                print("execute 1")
                
            }else{
                order=Order(name: OrderType.withdraw.rawValue, quantity: amount, price: amount, type: .withdraw)
                if amount > balance{
                    failurePopup(order)
                }else{
                successpupUp(order,completeTransaction)
                    
                }
            }
            
            
            
        
    }
    
    
    
    func completeTransaction(_ order:Order){
        if(order.type == OrderType.withdraw){
            balance-=order.price
        }else{
            balance += order.price
        }
        
        orders.append(order)
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
    
    
    
   
    @IBAction func returnToPrevious(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
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
