//
//  HealthCheckFirstVC.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Fawwaz Mayda on 21/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit
import CoreData



class HealthCheckFirstVC: UIViewController {
    
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var dataSource = HealthCheckReportModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        styleButton()
        createTodayLabel()
        setupWargaId()
        // Do any additional setup after loading the view.
    }
    
    func setupWargaId() {
        if let UserDefaultsString = UserDefaults.standard.string(forKey: "id_warga") {
            dataSource.id_warga = UserDefaultsString
        } else {
            dataSource.id_warga = "id_warga_dummy"
        }
    }
    func styleButton() {
        sendButton.backgroundColor = UIColor.blue
        sendButton.layer.cornerRadius = 8.0
    }
    func createTodayLabel() {
        let date = Date()
        let hari : String
        let bulan : String
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday,.day,.month,.year], from: date)
               switch components.weekday! {
               case 1:
                    hari = "Minggu"
               case 2:
                    hari = "Senin"
               case 3:
                    hari = "Selasa"
               case 4:
                    hari = "Rabu"
               case 5:
                    hari = "Kamis"
               case 6:
                    hari = "Jumat"
               default:
                    hari = "Sabtu"
               }
               
               switch components.month! {
               case 1:
                    bulan = "Januari"
               case 2:
                    bulan = "Februari"
               case 3:
                    bulan = "Maret"
               case 4:
                    bulan = "April"
               case 5:
                    bulan = "Mei"
               case 6:
                    bulan = "Juni"
               case 7:
                    bulan = "Juli"
               case 8:
                    bulan = "Agustus"
               case 9:
                    bulan = "September"
               case 10:
                    bulan = "Oktober"
               case 11:
                    bulan = "November"
               default:
                    bulan = "Desember"
               }
               todayLabel.text = "\(hari), \(components.day!) \(bulan) \(components.year!)"
    }
    
    func configureCheckMark(for cell: HealthCheckCell, indexPath: IndexPath) {
        cell.healthCheckListLabel.text = dataSource.healthCheckItemArray[indexPath.section].healthCheckStatusLabel
        if dataSource.healthCheckItemArray[indexPath.section].healthCheckStatus {
            cell.tickImageView.image = UIImage(systemName: "checkmark.rectangle.fill")
        } else {
            cell.tickImageView.image = nil
        }
    }
    @IBAction func sendTapped(_ sender: UIButton) {
        dataSource.persist(to: getViewContext()!)
    }
    
}

extension HealthCheckFirstVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.healthCheckItemArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HealthCheckCell.reuseIdentifier, for: indexPath) as? HealthCheckCell else {fatalError("Fail to get the cell")}
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1.2
        cell.layer.cornerRadius = 8.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        configureCheckMark(for: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource.healthCheckItemArray[indexPath.section].healthCheckStatus.toggle()
        guard let selectedCell = tableView.cellForRow(at: indexPath) as? HealthCheckCell else {fatalError("Cant convert cell")}
        configureCheckMark(for: selectedCell, indexPath: indexPath)
    }
    
}

extension HealthCheckFirstVC {
    func getViewContext() -> NSManagedObjectContext? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        return container?.viewContext
        
    }
}
