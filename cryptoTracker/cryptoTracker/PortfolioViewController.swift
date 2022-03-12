//
//  PortfolioViewController.swift
//  cryptoTracker
//
//  Created by Olisa Johnny Chukwu on 3/11/22.
//

import UIKit

class PortfolioViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadData()
    }
    
    var holding=[Crypto]()
    
    
    @IBOutlet weak var balanceLabel: UILabel!
    

    @IBOutlet weak var tableView: UITableView!
    
    
    func loadData(){
        holding=user.getHolding()
        tableView.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return holding.count
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        balanceLabel.text="\(balance)"
        
    }
    

    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "crypto", for: indexPath)
        
         let c = holding[indexPath.row]
        
        
        cell.textLabel?.text=c.name
        cell.detailTextLabel?.text = "\(user.getQuantity(c))"
        
        
        
            
    
        return cell
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
