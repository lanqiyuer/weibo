//
//  BaseTableViewController.swift
//  weibo
//
//  Created by mac on 15/11/27.
//  Copyright © 2015年 mac. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    //添加一个用户登录标记
    var userLogin = false
    
    //添加访客视图属性
    var visitorLoginView:VisitorLoginView?
    
    
    /*
    loadView() 准备视图层次结构加载视图，是苹果公司为手写代码专门准备的方法，
    因为一旦实现loadView()，sb/xib会自动失效
    loadView()方法会自动检测视图是否为空，如果为空会自动调用loadView()来加载视图
    所以没有实例化之前会进入死循环
    看做view的 get方法
    */
    
//    override func loadView() {
//        //print(view)
//        
//        //自定义视图
//        if userLogin {
//            
//            //用户登录显示tableView视图
//            super.loadView()
//            return
//        }
//       
//        //自定义访客视图
//        let newView = UIView()
//        newView.backgroundColor = UIColor.purpleColor()
//        view = newView
//    }
    
    //简化代码
    override func loadView() {
        //用户登录直接进入tableView表视图,没有登录就进入访客视图
        userLogin ? super.loadView() :setVisitorView()
    }
    
    private func setVisitorView() {
        
        //自定义访客视图
        visitorLoginView = VisitorLoginView()
//        newView.backgroundColor = UIColor.purpleColor()
        view = visitorLoginView

    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

   

}
