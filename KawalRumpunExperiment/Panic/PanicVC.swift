//
//  PanicVC.swift
//  KawalRumpunExperiment
//
//  Created by Rais Mohamad Najib on 21/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class PanicVC: UIViewController {

    @IBOutlet weak var panicButton: UIButton!
    
    var panicked : Bool = false
    
    @IBOutlet weak var testgetTime: UILabel!
    
    @IBOutlet weak var headerAtas: UILabel!
    @IBOutlet weak var deskripsiPanic: UILabel!
    
    var textPanicTurnOff : String = "“Tombol Darurat” hanya digunakan dalam kondisi darurat yangmana ponsel Anda akan segera menghubungi kontak darurat Anda serta memberikan notifikasi pada orang-orang sekitar Anda. Harap menggunakan fitur ini dengan penuh kesadaran dan tanggung jawab."
    
    var textPanicTurnOn : String = "Harap tetap tenang, bantuan segera datang!"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func panicButtonPress(_ sender: UIButton) {
        
        //check lagi on atau tidak
        if panicked == false {
            panicButton.setImage(#imageLiteral(resourceName: "Panic Buttorn Turn On Big"), for: .normal)
            panicked = true
            self.navigationController?.navigationBar.isHidden = true
            self.tabBarController?.tabBar.isHidden = true
            
            //self.headerAtas.text = "hoho ha ha"
            self.deskripsiPanic.text = textPanicTurnOn
            //self.deskripsiPanic.text = "Harap tetap tenang, bantuan segera datang!"
            deskripsiPanic.font = deskripsiPanic.font.withSize(13)
            deskripsiPanic.textAlignment = .center
           deskripsiPanic.font = .boldSystemFont(ofSize: 18)
            
            //get current date time
            let currentDateTime = Date()
            
            //get format time
            let formater = DateFormatter()
            formater.timeStyle = .medium
            formater.dateStyle = .long
            
            //date and time diubah jadi  stringfrom other the date object
            let dateTimeString = formater.string(from: currentDateTime)
            
            //dispay the waktunya
            self.testgetTime.text = dateTimeString
            
            
            
        } else {
            panicButton.setImage(#imageLiteral(resourceName: "Panic Button Turn Off Big"), for: .normal)
            panicked = false
            self.navigationController?.navigationBar.isHidden = false
            
            self.tabBarController?.tabBar.isHidden = false
            
            self.deskripsiPanic.text = textPanicTurnOff
            deskripsiPanic.font = deskripsiPanic.font.withSize(13)
            deskripsiPanic.textAlignment = .left
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
