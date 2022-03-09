//
//  ViewController.swift
//  cryptoTracker
//
//  Created by Olisa Johnny Chukwu on 3/7/22.
//

import UIKit

var stringUrl="https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=1h%2C24h%2C7d"

var allCryptos=[Crypto]()



class HomeViewController: UITableViewController {
    var favorites=["Bitcoin","Ethereum","Solana"]
    
//    @IBOutlet weak var bitcoin: UILabel!
//
//    @IBOutlet weak var bitcoinCh: UILabel!
//
//
//    @IBOutlet weak var ethereum: UILabel!
//
//    @IBOutlet weak var ethereumCh: UILabel!
//
//
//    @IBOutlet weak var solana: UILabel!
//
//    @IBOutlet weak var solanaCh: UILabel!
    
    
    
    @IBOutlet weak var bitcoin: UILabel!
    
    @IBOutlet weak var bitcoinCh: UILabel!
    
    
    @IBOutlet weak var bitcoinIcon: UIImageView!
    
    @IBOutlet weak var ethereum: UILabel!
    
    
    @IBOutlet weak var ethereumCh: UILabel!
    
    @IBOutlet weak var ethereumIcon: UIImageView!
    
    @IBOutlet weak var solana: UILabel!
    
    
    @IBOutlet weak var solanaCh: UILabel!
    
    @IBOutlet weak var solanaIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchData{
            self.tableView.reloadData()
           
        }
        
        
    }
    
    
    func fetchData(completed:@escaping ()-> ()){
        
        let  url=URL(string: stringUrl)!
        let defaultSession = URLSession(configuration: .default)
        
        let task=defaultSession.dataTask(with: url){
            
            (data,response,error) in
            
            let decoder=JSONDecoder()

            if let data=data{
               
                do{
                    allCryptos = try decoder.decode([Crypto].self, from:data)
                    
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                    for crypto in allCryptos {
                        self.setValues(crypto)
                       
                    }
                    
                    
                    
                }catch{
                    print(error)
                }
               
                
            }
        }

        task.resume()
        
    }
    
    func setValues(_ crypto:Crypto){
        DispatchQueue.main.async{
            
        if(crypto.name==self.favorites[0]){
            
            self.bitcoin.text = "\(crypto.price)"
            self.bitcoinCh.text=String(format: "%.2f", crypto.priceChange)
            if let data = try? Data(contentsOf:       URL(string: crypto.image)!){
                
                if let image=UIImage(data: data){
                    
                    self.bitcoinIcon.image=image
                    
                }
                
                
            }
            
        }else if(crypto.name==self.favorites[1]){
            self.ethereum.text = "\(crypto.price)"
            self.ethereumCh.text = String(format: "%.2f", crypto.priceChange)
            if let data = try? Data(contentsOf:       URL(string: crypto.image)!){
                
                if let image=UIImage(data: data){
                    
                    self.ethereumIcon.image=image
                    
                }
                
                
            }
        }else{
            self.solana.text = "\(crypto.price)"
            self.solanaCh.text = String(format: "%.2f", crypto.priceChange)
            if let data = try? Data(contentsOf:       URL(string: crypto.image)!){
                
                if let image=UIImage(data: data){
                    
                    self.solanaIcon.image=image
                    
                }
                
                
            }
        }
            
            
        }
    }
    
    
    


}

