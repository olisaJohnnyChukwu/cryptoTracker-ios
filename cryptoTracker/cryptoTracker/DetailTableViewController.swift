//
//  DetailTableViewController.swift
//  cryptoTracker
//
//  Created by Olisa Johnny Chukwu on 3/8/22.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var crypto:Crypto?
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var marketCap: UILabel!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var rank: UILabel!
    
    @IBOutlet weak var segcontrol: UISegmentedControl!
    
    @IBOutlet weak var ath: UILabel!
    
    @IBOutlet weak var athCh: UILabel!
    
    @IBOutlet weak var change: UILabel!
    
    @IBOutlet weak var supply: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let crypto = crypto {
            name.text=crypto.name
            price.text="$ \(crypto.price) "
            rank.text="#\(crypto.marketRank)"
            volume.text="$ \(crypto.totalVolume)"
            marketCap.text="$ "+String(format: "%.4f", setMarketCap(marketCap: crypto.market))+" B"
            setImage(image: crypto.image)
            ath.text="\(crypto.ath)"
            athCh.text=String(format: "%.2f", crypto.athCh)+" %"
            change.text=String(format: "%.2f", crypto._1hr)+" %"
            supply.text=String(format:"%.2f" , crypto.supply/1000000)+" Mil"
            }
        
        
    }
    
    @IBAction func percentageByTime(_ sender: UISegmentedControl) {
        
        let selectedSeg=sender.selectedSegmentIndex
        if(selectedSeg==0){
            change.text=String(format: "%.2f", crypto!._1hr)+" %"
        }else if(selectedSeg==1){
            change.text=String(format: "%.2f", crypto!._24h)+" %"
        }else{
            change.text=String(format: "%.2f", crypto!._7d)+" %"
        }
        
        
    }
    
    func setImage(image:String){
        if let data = try? Data(contentsOf:       URL(string:image)!){
            
            if let image=UIImage(data: data){
                
                icon.image=image
                
            }
            
            
        }
    }
    
   func  setMarketCap(marketCap:Double)->Double{
        
       let num=marketCap/1000000000
       
       return num
   }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
