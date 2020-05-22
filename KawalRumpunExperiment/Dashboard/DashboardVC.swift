//
//  DashboardVC.swift
//  KawalRumpunExperiment
//
//  Created by Firza Ilhami on 21/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup navigation bar property
        setNavBar()
              
        // Adding subtitle above large title
        self.navigationItem.titleView = setTitle(title: "", subtitle: getCurrentDay())
    }
    
    func getCurrentDay() -> String {
        // Get current date and time
        let currentDateTime = Date()
        
        // Initializes the date formater and set the style:
        let formatter = DateFormatter()
        formatter.dateStyle  = .full
        formatter.timeStyle = .none
        formatter.generatesCalendarDates = true
        formatter.locale = Locale(identifier: "id_ID")
        
        // Get the date from date object
        let dateString = formatter.string(from: currentDateTime)
        
        return dateString
    }
    
    func setNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true

        // Set background color navbar to blue based on design
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red:0.333, green:0.541, blue:0.910, alpha:1.00)
        
        // Set large title color to white
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        // Applying navbar property on all state appearance
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
    }
    
    func setTitle(title:String, subtitle:String) -> UIView {

        // Get navigation Bar Height and Width
        let navigationBarHeight = Int(self.navigationController!.navigationBar.frame.height)
        let navigationBarWidth = Int(self.navigationController!.navigationBar.frame.width)

        // Y position for Title and Subtitle
        var y_Title = 0.0
        var y_SubTitle = 0.0

        // Set Y position
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            // If screen height equal iPhone 5S and SE
            case 1136:
                y_Title = 46
                y_SubTitle = 20
                print("iPhone 5S and SE")
            // If screen height equal iPhone 6, 6+, 6S, 6S+, 7, 7+, 8, 8+ and X
            case 1334, 1920, 2208, 2436:
                y_Title = 48
                y_SubTitle = 30
                print("iPhone 6, 6+, 6S, 6S+, 7, 7+, 8, 8+ and X")
            default:
//
                y_Title = 29
                y_SubTitle = 30
                print("Default")
            }
        }

        // Set Font size and weight for Title and Subtitle
        let titleFont = UIFont.systemFont(ofSize: 33, weight: UIFont.Weight.bold)
        let subTitleFont = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)

        // Title label
        let titleLabel = UILabel(frame: CGRect(x: 8.5, y: y_Title, width: 0, height: 0))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.white
        titleLabel.font = titleFont
        titleLabel.text = title
        titleLabel.sizeToFit()

        // SubTitle label
        let subtitleLabel = UILabel(frame: CGRect(x: 8.5, y: y_SubTitle, width: 0, height: 0))
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        subtitleLabel.font = subTitleFont
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()

        // Add Title and Subtitle to View
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: navigationBarWidth, height: navigationBarHeight))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)

        return titleView

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
