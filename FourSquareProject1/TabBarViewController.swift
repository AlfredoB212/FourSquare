//
//  TabBarViewController.swift
//  FourSquareProject1
//
//  Created by Matthew Huie on 2/11/19.
//  Copyright © 2019 Alfredo Barragan. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search30"), tag: 0)
        
       
        
        
        let tabBarList = [UINavigationController(rootViewController: searchViewController)]
        
        viewControllers = tabBarList
    }
    

    

}
