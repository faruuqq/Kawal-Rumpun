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
        // Do any additional setup after loading the view.
    }
    func styleButton() {
        sendButton.backgroundColor = UIColor.blue
        sendButton.layer.cornerRadius = 8.0
    }
    
    func configureCheckMark(for cell: HealthCheckCell, indexPath: IndexPath) {
        cell.healthCheckListLabel.text = dataSource.healthCheckItemArray[indexPath.row].healthCheckStatusLabel
        if dataSource.healthCheckItemArray[indexPath.row].healthCheckStatus {
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
        return dataSource.healthCheckItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HealthCheckCell.reuseIdentifier, for: indexPath) as? HealthCheckCell else {fatalError("Fail to get the cell")}
        configureCheckMark(for: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSource.healthCheckItemArray[indexPath.row].healthCheckStatus.toggle()
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
