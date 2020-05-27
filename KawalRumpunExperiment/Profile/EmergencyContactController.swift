//
//  EmergencyContactController.swift
//  KawalRumpunExperiment
//
//  Created by Daiva Adisurya on 27/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class EmergencyContactController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    @IBOutlet weak var tableViewApproval: UITableView!
    
    var keluarga = ["Virza Piter"]
    var approval = ["Prima C"]
    
    var imagekeluarga = [#imageLiteral(resourceName: "Virza"), #imageLiteral(resourceName: "Atur Kontak")]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == myTableView {
            return keluarga.count
        
        } else if tableView == tableViewApproval {
            return approval.count}
        
        return Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if tableView == myTableView {
              let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                          cell.textLabel?.text = keluarga[indexPath.row]
              
              cell.imageView?.image = imagekeluarga [indexPath.row]
        return (cell)
        
        } else if tableView == tableViewApproval {
              let cellApproval =  tableView.dequeueReusableCell(withIdentifier: "cellApproval", for: indexPath)
                          cellApproval.textLabel?.text = approval[indexPath.row]
              
              cellApproval.imageView?.image = imagekeluarga [indexPath.row]
    
    return (cellApproval)
          }
        return UITableViewCell()

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
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
