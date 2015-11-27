//
//  MainViewController.swift
//  weibo
//
//  Created by mac on 15/11/27.
//  Copyright © 2015年 mac. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       addChildViewControllers()
    
    }

    //添加首页的 tabBarController 
    private func addChildViewControllers() {
        
        let home = HomeTableViewController()
        
        let nav = UINavigationController(rootViewController: home)
        
        
        home.title = "首页"
        home.tabBarItem.image = UIImage(named: "tabbar_home")
        home.tabBarItem.selectedImage = UIImage(named: "tabbar_home_highlighted")
        
        addChildViewController(nav)
        
    }
    
    
}
