//
//  PatientTabBarController.swift
//  Demo-App
//
//  Created by deepak-pt6306 on 13/03/23.
//

import UIKit

class PatientTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       set()
    }
    
    
   let home = PatientHomePage()
   let reports = ReportsPage()
   let consult = Consult()
   let search = PatientSearchController()
    
    func set(){
        
        home.tabBarItem = UITabBarItem(title: "Home", image:UIImage(systemName: "house") , tag: 0)
        search.tabBarItem = UITabBarItem(title: "Book Appointment", image:UIImage(systemName: "calendar.badge.clock") , tag: 1)
        reports.tabBarItem = UITabBarItem(title: "Reports", image:UIImage(systemName: "list.bullet.clipboard.fill") , tag: 2)
        consult.tabBarItem = UITabBarItem(title: "Appointments", image:UIImage(systemName: "person.badge.clock.fill") , tag: 3)
        
        
        setViewControllers([home,search,consult,reports], animated: false)
        modalPresentationStyle = .fullScreen
        tabBar.backgroundColor = .lightGray
        
            
        
    }

}
