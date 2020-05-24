//
//  ProfileViewController.swift
//  KawalRumpunExperiment
//
//  Created by Daiva Adisurya on 22/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    var menu = ["Atur Kontak Darurat", "Info Akun", "Notifikasi", "Tentang Aplikasi", "Log Out"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                   cell.textLabel?.text = menu[indexPath.row]
                   
               return(cell)
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueIdentifier: String
        switch indexPath.row {
        case 0: //For "one"
             segueIdentifier = "showView1"
        case 1: //For "two"
             segueIdentifier = "showView2"
        default: //For "three"
             segueIdentifier = "showView3"
        }
        self.performSegue(withIdentifier: segueIdentifier, sender: self)
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
