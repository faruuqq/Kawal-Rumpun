//
//  MessagesViewController.swift
//  KawalRumpunExperiment
//
//  Created by Rais Mohamad Najib on 25/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableMessages: UITableView!
    
    @IBOutlet weak var namaSegmentedCon: UISegmentedControl!
    
    //bikin strcut buat dummy
    struct Category {
        var categoryDate: String
        var categoryName: String
        var categoryImage: String
    }
    
    //buat array dummy
    var categoriesDummy = [
        Category(categoryDate: "10 September", categoryName: "Hai Amalia", categoryImage: "Complain"),
        Category(categoryDate: "12 September", categoryName: "Hai Kamuuuu", categoryImage: "Guest-Log"),
        Category(categoryDate: "13 September", categoryName: "Hai Diaaa", categoryImage: "Complain"),
        Category(categoryDate: "14 September", categoryName: "Hai Bukan kamu", categoryImage: "Complain"),
        Category(categoryDate: "15 September", categoryName: "Hai Gimana yak", categoryImage: "Siskamling"),
        Category(categoryDate: "10 September", categoryName: "Hai Amalia", categoryImage: "Complain"),
        Category(categoryDate: "12 September", categoryName: "Hai Kamuuuu", categoryImage: "Guest-Log"),
        Category(categoryDate: "13 September", categoryName: "Hai Diaaa", categoryImage: "Complain"),
        Category(categoryDate: "14 September", categoryName: "Hai Bukan kamu", categoryImage: "Guest-Log"),
        Category(categoryDate: "15 September", categoryName: "Hai Gimana yak", categoryImage: "Complain"),
        Category(categoryDate: "10 September", categoryName: "Hai Amalia", categoryImage: "Guest-Log"),
        Category(categoryDate: "12 September", categoryName: "Hai Kamuuuu", categoryImage: "Complain"),
        Category(categoryDate: "13 September", categoryName: "Hai Diaaa", categoryImage: "Siskamling"),
        Category(categoryDate: "14 September", categoryName: "Hai Bukan kamu", categoryImage: "Siskamling"),
        Category(categoryDate: "15 September", categoryName: "Hai Gimana yak", categoryImage: "Siskamling"),
    ]
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.dataSource = self
        
        setupNavBAr()
        
//        self.tableView.delgate = self
//        self.tableView.dataSource = self
        //untuk nunjukin func di table
        tableMessages.delegate = self
        tableMessages.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func messegaesSegmented(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            categoriesDummy = [
                Category(categoryDate: "10 September", categoryName: "Hai Amalia", categoryImage: "Complain"),
                Category(categoryDate: "12 September", categoryName: "Hai Kamuuuu", categoryImage: "Guest-Log"),
                Category(categoryDate: "13 September", categoryName: "Hai Diaaa", categoryImage: "Complain"),
                Category(categoryDate: "14 September", categoryName: "Hai Bukan kamu", categoryImage: "Complain"),
                Category(categoryDate: "15 September", categoryName: "Hai Gimana yak", categoryImage: "Siskamling"),
                Category(categoryDate: "10 September", categoryName: "Hai Amalia", categoryImage: "Complain"),
                Category(categoryDate: "12 September", categoryName: "Hai Kamuuuu", categoryImage: "Guest-Log"),
                Category(categoryDate: "13 September", categoryName: "Hai Diaaa", categoryImage: "Complain"),
                Category(categoryDate: "14 September", categoryName: "Hai Bukan kamu", categoryImage: "Guest-Log"),
                Category(categoryDate: "15 September", categoryName: "Hai Gimana yak", categoryImage: "Complain"),
                Category(categoryDate: "10 September", categoryName: "Hai Amalia", categoryImage: "Guest-Log"),
                Category(categoryDate: "12 September", categoryName: "Hai Kamuuuu", categoryImage: "Complain"),
                Category(categoryDate: "13 September", categoryName: "Hai Diaaa", categoryImage: "Siskamling"),
                Category(categoryDate: "14 September", categoryName: "Hai Bukan kamu", categoryImage: "Siskamling"),
                Category(categoryDate: "15 September", categoryName: "Hai Gimana yak", categoryImage: "Siskamling"),
            ]
            tableMessages.reloadData()
        } else if sender.selectedSegmentIndex == 1 {
            categoriesDummy = [
                Category(categoryDate: "xxxxxxxxxxxx", categoryName: "Hai Amalia", categoryImage: "HealthCheck"),
                Category(categoryDate: "12 September", categoryName: "Hai Kamuuuu", categoryImage: "ChekInOut"),
                Category(categoryDate: "13 September", categoryName: "Hai Diaaa", categoryImage: "HealthCheck"),
                Category(categoryDate: "14 September", categoryName: "Hai Bukan kamu", categoryImage: "HealthCheck"),
                Category(categoryDate: "15 September", categoryName: "Hai Gimana yak", categoryImage: "ChekInOut"),
                Category(categoryDate: "10 September", categoryName: "Hai Amalia", categoryImage: "HealthCheck"),
                Category(categoryDate: "12 September", categoryName: "Hai Kamuuuu", categoryImage: "ChekInOut"),

            ]
            tableMessages.reloadData()
        }
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
        //searchController.searchBar.scopeButtonTitles = ["Hai","Bu"]
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
            
        
//        let items = ["Label A", "Label B"]
//        let segmentedController = UISegmentedControl(items: items)
//            navigationItem.titleView = segmentedController
    
        }
    }
    
    //Edut Tableview
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesDummy.count
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMessages", for: indexPath)
        let category = categoriesDummy[indexPath.row]
        //cell.reloadInputViews()
        cell.textLabel?.text = category.categoryDate
        cell.detailTextLabel?.text = category.categoryName
        cell.imageView?.image = UIImage(named: category.categoryImage)
        //cell.textLabel?.text = "Coba Section\(indexPath.section) Row \(indexPath.row)"
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoriesDummy[indexPath.row]
        performSegue(withIdentifier: "toReportCell", sender: category)
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
