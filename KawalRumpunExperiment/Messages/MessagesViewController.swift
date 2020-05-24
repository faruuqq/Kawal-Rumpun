//
//  MessagesViewController.swift
//  KawalRumpunExperiment
//
//  Created by Rais Mohamad Najib on 25/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBAr()

        // Do any additional setup after loading the view.
    }
    
    func setupNavBAr(){
        //input nama title
        self.navigationItem.title = "Pesan Masuk"
        //input nvaigationtitle ke pojok kiri dan besar
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //setwarna NavigationBar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        //warna biru yang sama dengan mas Firza
        appearance.backgroundColor = UIColor(red:0.333, green:0.541, blue:0.910, alpha:1.00)
        //merubah titlecolor
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        //implementasikan di view yang background dan large textnya
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        //create SearchBar
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
        //change searchbar color
        let searchBar = searchController.searchBar
        searchBar.placeholder = "Pencarian"
        searchBar.tintColor = UIColor.white
        searchBar.barTintColor = UIColor.white
        searchBar.isTranslucent = false
        searchBar.isOpaque = false
        
        //ngasih warna dalam kotaknya bro
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField{
            textfield.textColor = UIColor.black
            textfield.backgroundColor = UIColor.white
            textfield.layer.cornerRadius = 10
            textfield.clipsToBounds = true
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
