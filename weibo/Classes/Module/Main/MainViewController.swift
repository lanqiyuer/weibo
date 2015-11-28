//
//  MainViewController.swift
//  weibo
//
//  Created by mac on 15/11/27.
//  Copyright © 2015年 mac. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    
    let mainTabBar = MainTabBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //系统的tabBar 是只读属性，不能直接操作
        //需要自定义tabBar，用KVC机制动态修改tabBar身份
        
        setValue(mainTabBar, forKey: "tabBar")
        //撰写按钮响应事件
        mainTabBar.composeBtn.addTarget(self, action: "composeBtnDidClick", forControlEvents: .TouchUpInside)
        
//        //打印对象类的字段
//        print(tabBar.classForCoder)

       addChildViewControllers()
    
    }
    

    //方法选择处理器 崩溃在MAIN地方时 是因为  OC机制导致的错误
    //MARK: 撰写按钮的监听事件
    //target-action 机制 直接使用OC
    //方法选择器 相关的这种机制  都是OC中机制
    //为了 让 swift中的语法 能够兼容OC方法选择器 需要使用 @objc
    @objc private func composeBtnDidClick() {
            print(__FUNCTION__)
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
