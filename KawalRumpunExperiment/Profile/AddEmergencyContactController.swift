//
//  AddEmergencyContactController.swift
//  KawalRumpunExperiment
//
//  Created by Daiva Adisurya on 27/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class AddEmergencyContactController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var tambahKeluarga: UIButton!
    
    
    var keluarga = ["Ayah", "Ibu", "Kakak", "Adik", "Lainnya"]
    
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        keluarga.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                           cell.textLabel?.text = keluarga[indexPath.row]
        return (cell)
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
         
         
         tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = UITableViewCell.AccessoryType.none
    }

    
    
    @IBAction func tambahKontakDidTapped(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Tambah kontak darurat?", message: "Kontak darurat dibutuhkan ketika terjadi keadaan darurat", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ya", style: UIAlertAction.Style.default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Tidak", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
        
    }
    
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
            myTableView.dataSource = self
        
        tambahKeluarga.layer.cornerRadius = 5
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
