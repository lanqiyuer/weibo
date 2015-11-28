//
//  MainTabBar.swift
//  weibo
//
//  Created by mac on 15/11/27.
//  Copyright © 2015年 mac. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {

    /*
    初始化方法 使用init(frame:CGRect) ,系统默认当前的类只能通过手动代码的方式进行创建
    required init?(coder aDecoder: NSCoder) ,默认通过Xib/storyboard加载视图就会实现报错信息;如果希望自定义的视图 手码创建/Xib/storyboard ,就将包错信息注释，但要调用super.init(coder: aDecoder)
    */
    override init(frame:CGRect) {
        
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setupUI()
    }
    
    
    //添加子视图 中间自定义的按钮
    private func setupUI() {
        
        addSubview(composeBtn)
    }
    
    
    /*
    
    懒加载 撰写按钮:添加自定义的+ 按钮
    */
    lazy var composeBtn: UIButton = {
        
        let btn = UIButton()
       /* btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState:.Highlighted)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
        */
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)

        //必须自适应大小  否则不会显示
        btn.sizeToFit()
        
        return btn
        }()
    

    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        //print(subviews)
        
        let w = screenW / 5
        let h = self.bounds.height
        let rect = CGRect(x: 0, y: 0, width: w, height: h)
        
        
        //定义索引
        var index: CGFloat = 0
    
        for v in subviews {
            
           //UITabBarButton 是苹果的私有类，拿不到
            if v.isKindOfClass(NSClassFromString("UITabBarButton")!) {
                
                //修改frame
                v.frame = CGRectOffset(rect, w * index, 0)
            
                // print(v)
                
//                if index==1 {
//                    index++
//                }
//                index++
                
                
                //注意使用三目运算 简化代码
                index +=  (index == 1 ? 2:1)
            }
        }
        
        //设置撰写按钮的frame
        composeBtn.frame = CGRectOffset(rect, w * 2, 0)
//        composeBtn.frame = CGRectOffset(rect, w * 2, -20)
//        //会被backgroundView上端的线盖住 ，把撰写按钮弄到最上层
//        bringSubviewToFront(composeBtn)
    }
    
    
}
