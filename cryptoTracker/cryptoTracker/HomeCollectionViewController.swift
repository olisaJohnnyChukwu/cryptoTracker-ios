//
//  HomeCollectionViewController.swift
//  cryptoTracker
//
//  Created by Olisa Johnny Chukwu on 3/12/22.
//

import UIKit


var stringUrl="https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=1h%2C24h%2C7d"

var allCryptos=[Crypto]()
var orders=[Order]()

var user:User=User()


var balance=10000.0



class HomeCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    var list=[Crypto]()
    
    
    override func viewDidDisappear(_ animated: Bool) {
        allCryptos=sortByMarketCapAscending()
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return allCryptos.count
    }
    
    
    @IBOutlet weak var segControl: UISegmentedControl!
    
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        print("executed")
        
        if let cryptoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "crypto", for: indexPath) as? CryptoCollectionViewCell {
            
            cryptoCell.configure(crypto: allCryptos[indexPath.row])
            cell = cryptoCell
            
        }
        
        return cell

    }
    
    
    
    @IBOutlet weak var balanceLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        balanceLabel.text="\(balance)"
        // Do any additional setup after loading the view.
        fetchData{
            self.collectionView.reloadData()
           
        }
        
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        balanceLabel.text="\(balance)"
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func sortByMarketCapAscending()->[Crypto]{
        
        return allCryptos.sorted{
            $0.market > $1.market
        }
    }
    
    func sortByMarketCapDescending()->[Crypto]{
        
        return allCryptos.sorted{
             $0.market < $1.market
        }
    }
    
    
    
    func sortByTopPerformers()->[Crypto]{
        
        
        
        return allCryptos.sorted{
            $0._24h > $1._24h
        }
    }
    
    
    func sortByWorstPerformers()->[Crypto]{
        
        return allCryptos.sorted{
            $0._24h < $1._24h
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let cryptoDetailsViewController = segue.destination as? TradeViewController
        else{
            return
        }
        
        if let index = collectionView.indexPathsForSelectedItems{
            
            cryptoDetailsViewController.crypto=allCryptos[index[0].row]
        }
        
    }
    
    
    

    @IBAction func sortCollection(_ sender: UISegmentedControl) {
        
        let index=sender.selectedSegmentIndex
        
        
        if(index == 0){
            allCryptos = sortByTopPerformers()
        }else if(index == 1){
            allCryptos = sortByWorstPerformers()
        }else if (index == 2){
            allCryptos = sortByMarketCapAscending()
        }else{
            allCryptos = sortByMarketCapDescending()
        }
        
       
        
        collectionView.reloadData()
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
//
//                    for i in 0 ... 9{
//                        self.list.append(allCryptos[i])
//                    }
                    
                    
                }catch{
                    print(error)
                }
               
                
            }
        }

        task.resume()
        
    }
    
    
    
}



