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
        
        //颜色这样设置提升效率
        self.tabBar.tintColor = UIColor.orangeColor()
        
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        
        addChildViewController(DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        
        addChildViewController(ProfileTableViewController(), title: "我", imageName: "tabbar_profile")
        
    }
    
    
    //抽取方法： 根据传入控制器，设置相应的标题、图片
    private func addChildViewController(vc: UIViewController, title: String,imageName: String) {
        
        let nav = UINavigationController(rootViewController:vc)
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
    
        addChildViewController(nav)
    }
    
    
    
    
}
