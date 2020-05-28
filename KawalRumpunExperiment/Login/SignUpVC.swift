//
//  SignUpVC.swift
//  KawalRumpunExperiment
//
//  Created by Firza Ilhami on 23/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit


class SignUpVC: UIViewController {

    @IBOutlet weak var namaTF: UITextField!
    @IBOutlet weak var emailRegisterTF: UITextField!
    @IBOutlet weak var noHPTF: UITextField!
    @IBOutlet weak var alamatTF: UITextField!
    @IBOutlet weak var alamatRTTF: UITextField!
    @IBOutlet weak var alamatRWTF: UITextField!
    @IBOutlet weak var inputPassword1TF: UITextField!
    @IBOutlet weak var inputPassword2TF: UITextField!
    @IBOutlet weak var shareLocSwitch: UISwitch!
    @IBOutlet weak var emailKeluargaTF: UITextField!
    @IBOutlet weak var listKeluargaTable: UITableView!
    
    let listKeluarga = ["Ayah", "Ibu", "Suami", "Istri", "Saudara Laki-laki", "Saudara Perempuan", "Lainya"]
    var relationFamily = ""
    var registrasi: Registration?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listKeluargaTable.delegate = self
        listKeluargaTable.dataSource = self
        print(shareLocSwitch.isOn)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func daftar(_ sender: UIButton) {
        
        registrasi = Registration(
            nama: namaTF.text!,
            email: emailRegisterTF.text!,
            noHP: noHPTF.text!,
            alamat: alamatTF.text!,
            rt: Int16(alamatRTTF.text!.trimmingCharacters(in: .whitespacesAndNewlines))!,
            rw: Int16(alamatRTTF.text!.trimmingCharacters(in: .whitespacesAndNewlines))!,
            password: "",
            shareLoc: shareLocSwitch.isOn,
            famRelationType: relationFamily,
            emailFam: emailKeluargaTF.text!
        )
        
        if inputPassword1TF.text! == inputPassword2TF.text! {
            registrasi?.password = inputPassword2TF.text!
        }
        registrasi?.shareLoc = shareLocSwitch.isOn
        
        registrasi?.saveToPersistent(viewContext: AppDelegate.viewContext)
 
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


