//
//  ReportFirstVC.swift
//  KawalRumpunExperiment
//
//  Created by Muhammad Fawwaz Mayda on 21/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit
import CoreData


struct ReportModel {
    var id: String {
        return UUID().uuidString
    }
    var id_warga : String?
    var keluhanType : String?
    var complaintText : String?
    var imageData : UIImage?
    var date: Date?
}

enum Keluhan:String {
    case kesehatan = "kesehatan"
    case fasilitas = "fasilitas"
    case sosial = "sosial"
}

extension Report {
    static func save(context : NSManagedObjectContext, report : ReportModel)-> Report? {
        
        if let date=report.date,
            let complaint = report.complaintText,
            let type = report.keluhanType,
            let id_warga = report.id_warga,
            let photo = report.imageData {
            let newReport = Report(context: context)
            newReport.date = date
            newReport.type = type
            newReport.id = report.id
            newReport.id_warga = id_warga
            newReport.photo = photo.jpegData(compressionQuality: 1.0)
            newReport.complaint = complaint
            
            let newNotif = Notification(context: context)
            newNotif.id = UUID().uuidString
            newNotif.id_related = report.id
            newNotif.tipe = "HealthCheck"
            do {
                try context.save()
                return newReport
            } catch {
                return nil
            }
        }
        return nil
    }
}

extension Notification {
    static func save(context: NSManagedObjectContext, report: ReportModel) {
        
    }
}
class ReportFirstVC: UIViewController {
    var currentIdWarga = ""
    var thisReport = ReportModel()
    @IBOutlet weak var complaintTextField: UITextField!
    @IBOutlet weak var kesehatanButton: UIButton!
    @IBOutlet weak var fasilitasButton: UIButton!
    @IBOutlet weak var sosialButton: UIButton!
    @IBOutlet weak var selanjutnyaButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Asume we have the user already logged in
        if let userDefaultsIdWarga = UserDefaults.standard.string(forKey: "id_warga") {
            if userDefaultsIdWarga.isEmpty {
                currentIdWarga = "dummy_id_warga"
            } else {
                currentIdWarga = userDefaultsIdWarga
            }
        }
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        for button in [fasilitasButton,kesehatanButton,sosialButton] {
            button?.layer.cornerRadius = 10.0
            button?.backgroundColor = UIColor.systemGray2
        }
    }
    
    @IBAction func addPhotoTapped(_ sender: UIButton) {
        print("TAP")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera")
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            present(imagePicker,animated: true)
        } else if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            present(imagePicker,animated: true)
            print("Photo Lib")
        }
        print("No Presents")
     
    }
    @IBAction func reportTypeButtonTapped(_ sender: UIButton) {
        for button in [fasilitasButton,kesehatanButton,sosialButton] {
            if button==sender {
                button?.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
            } else {
                button?.backgroundColor = UIColor.systemGray2
            }
        }
        switch sender {
        case fasilitasButton:
            thisReport.keluhanType = Keluhan.fasilitas.rawValue
        case kesehatanButton:
            thisReport.keluhanType = Keluhan.kesehatan.rawValue
        default:
            thisReport.keluhanType = Keluhan.sosial.rawValue
        }
    }
    
    @IBAction func sendReportTapped(_ sender: UIButton) {
        thisReport.complaintText = complaintTextField.text
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour,.minute,.day, .month, .year], from: date)
        thisReport.date = components.date
        thisReport.id_warga = currentIdWarga
        _ = Report.save(context: getViewContext()!, report: thisReport)
    }
    
    
}

extension ReportFirstVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {fatalError("Cant convert to UIImage")}
        thisReport.imageData = image
    }
}

extension ReportFirstVC {
    func getViewContext() -> NSManagedObjectContext? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        return container?.viewContext
    }
}
