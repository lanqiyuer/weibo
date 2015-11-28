//
//  VisitorLoginView.swift
//  weibo
//
//  Created by mac on 15/11/27.
//  Copyright © 2015年 mac. All rights reserved.
//

import UIKit

class VisitorLoginView: UIView {

    //自定义访问视图
    
   override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        setupUI()
    
    }
    

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    
    private func setupUI() {
    
        addSubview(circleView)
        addSubview(iconView)
        addSubview(tipLable)
        addSubview(loginBtn)
        addSubview(registerBtn)
    }
    
    
    
    /*
    加载子视图
    */
    
    private lazy var circleView: UIImageView  = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    private lazy var iconView: UIImageView  = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    //提示文案
    private lazy var tipLable: UILabel = {
        let wordLabel = UILabel()
        
        wordLabel.text = "关注一些人，回这里看看有什么惊喜"
        wordLabel.textColor = UIColor.lightGrayColor()
        
        wordLabel.font = UIFont.systemFontOfSize(14.0)
        wordLabel.textAlignment = NSTextAlignment.Center
        
        wordLabel.sizeToFit()
        
        return wordLabel
    }()
    
    //登录按钮
    private lazy var loginBtn: UIButton = {
        let loginBtn = UIButton()
        
        loginBtn.setTitle("登录", forState: .Normal)
        loginBtn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState:.Normal)
        loginBtn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        
        loginBtn.sizeToFit()
        
        return loginBtn
    }()
    
    //注册按钮
    private lazy var registerBtn: UIButton = {
        
        let registerBtn = UIButton()
        
        registerBtn.setTitle("登录", forState: .Normal)
        registerBtn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState:.Normal)
        registerBtn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        
        registerBtn.sizeToFit()
        
        return registerBtn
        }()

    
}
