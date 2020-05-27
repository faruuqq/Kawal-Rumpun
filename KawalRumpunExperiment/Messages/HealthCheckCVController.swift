//
//  HealthCheckCVController.swift
//  KawalRumpunExperiment
//
//  Created by Rais Mohamad Najib on 27/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

private let reuseIdentifier = "healtchekCell"

class HealthCheckCVController: UICollectionViewController {
    
    var healthCheckStatusLabel : String = ""
    var healthCheckStatus : Bool = false
    
    struct dummyTableView{
        var categoryDate: String
        var categoryName: String
        var categoryImage: String
    }
        

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(HealthCheckCVCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setupNavBAr()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? HealthCheckCVCell else {fatalError("Cell error")}
        cell.todayLabel.text = "Hi Jude"
        
        //guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "guestCell", for: indexPath) as? GuestCVCell else { fatalError("Cell error")}
    
        // Configure the cell
        return cell
    }
    
    func setupNavBAr(){
            //input nama title
        self.navigationItem.title = "Cek Kesehatan"
            //input nvaigationtitle ke pojok kiri dan besar
        navigationController?.navigationBar.prefersLargeTitles = true
        //tombol back jadi putih
        self.navigationController?.navigationBar.tintColor = .white
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

    //        let items = ["Label A", "Label B"]
    //        let segmentedController = UISegmentedControl(items: items)
    //            navigationItem.titleView = segmentedController
        
            }
        }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

