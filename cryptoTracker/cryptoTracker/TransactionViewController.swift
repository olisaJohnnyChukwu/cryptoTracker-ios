//
//  TransactionViewController.swift
//  cryptoTracker
//
//  Created by Olisa Johnny Chukwu on 3/11/22.
//

import UIKit

class TransactionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var segControl: UISegmentedControl!
    
    var allOrders=[Order]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "order", for: indexPath)
        
        
        let order = allOrders[indexPath.row]
        
       
        
        
        
        cell.textLabel?.text=order.name
       
        
        cell.detailTextLabel?.text = (order.type == OrderType.withdraw || order.type == OrderType.sell ? "- " :"+ ") + "$ \(order.price)"
        
        
        
        
        
        
        return cell
        
    }
    
    
    @IBAction func fIlterTableDisplay(_ sender: UISegmentedControl) {
        loadData()
    }
    
    func filterList()->[Order]{
        let index=segControl.selectedSegmentIndex
        if index != 0{
            return orders.filter{
                $0.type.rawValue == segControl.titleForSegment(at: index)
            }
        }
        
        
        return orders
        
        
    }
    
    func loadData(){
        
        allOrders=filterList()
        tableview.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        let order=allOrders[indexPath.row]
        
        let alert = UIAlertController(title: "Details", message: order.description, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        tableview.deselectRow(at: indexPath, animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
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
