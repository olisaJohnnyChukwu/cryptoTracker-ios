//
//  DetailViewController.swift
//  cryptoTracker
//
//  Created by Olisa Johnny Chukwu on 3/7/22.
//

import UIKit

class DetailViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var crypto:Crypto?
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let crypto = crypto {
            
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
