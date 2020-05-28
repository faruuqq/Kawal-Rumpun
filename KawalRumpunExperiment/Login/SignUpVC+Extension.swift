//
//  SignUpVC+Extension.swift
//  KawalRumpunExperiment
//
//  Created by Firza Ilhami on 28/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

extension SignUpVC: UITextFieldDelegate {
    
}

extension SignUpVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        
        if let relasi = cell?.textLabel?.text {
            relationFamily = relasi
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listKeluarga.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listKeluargaTable.dequeueReusableCell(withIdentifier: "statusKeluargaCell", for: indexPath)
        cell.textLabel?.text = listKeluarga[indexPath.row]
        return cell
    }
    
    
}
