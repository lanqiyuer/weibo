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
        addSubview(backView)
        addSubview(iconView)
        addSubview(tipLable)
        addSubview(loginBtn)
        addSubview(registerBtn)
        
        
        //VFN可视化自动布局
        //使用VFL手动添加约束 必须将frame 设置视图的位置的属性 关闭
        /**
        *  将约束添加到父视图
        *  NSLayoutConstraint()
        *  @param item         添加约束的对象
        *  @param attribute    要添加约束的属性
        *  @param relatedBy    相对的约束,一般使用 精准约束 equal
        *  @param toItem       添加的约束 相对于的视图
        *  @param attribute    相对约束的对象的属性
        *  @param multiplier   约束的关系乘积值
        *  @param constant     约束值
        *
        *  @return "view1.attr1 = view2.attr2 * multiplier + constant
        */
//把所有子控件的设置frame 的自动设置位置的约束 关闭
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        //圆圈
//        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        addConstraint(NSLayoutConstraint(item: circleView, attribute:.CenterX, relatedBy:.Equal, toItem: self, attribute:.CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: circleView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
        
        //中间房子
        addConstraint(NSLayoutConstraint(item: iconView, attribute:.CenterX, relatedBy: .Equal, toItem: circleView, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .CenterY, relatedBy: .Equal, toItem: circleView, attribute: .CenterY, multiplier: 1, constant: 0))
        
        //文字
        addConstraint(NSLayoutConstraint(item: tipLable, attribute: .CenterX, relatedBy: .Equal, toItem: circleView, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: tipLable, attribute: .Top, relatedBy: .Equal, toItem: circleView, attribute:.Bottom, multiplier: 1, constant: 16))
        addConstraint(NSLayoutConstraint(item: tipLable, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 230))
        addConstraint(NSLayoutConstraint(item: tipLable, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 40))
        
        //登录按钮
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .Left, relatedBy: .Equal, toItem: tipLable, attribute: .Left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .Top, relatedBy: .Equal, toItem: tipLable, attribute:.Bottom, multiplier: 1, constant: 20))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 35))
        
        //注册按钮
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Right, relatedBy: .Equal, toItem: tipLable, attribute: .Right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Top, relatedBy: .Equal, toItem: tipLable, attribute:.Bottom, multiplier: 1, constant: 20))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 35))
        
        
        //约束遮罩视图
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[maskView]-0-|", options: [], metrics: nil, views: ["maskView":backView]))

        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[maskView]-(-35)-[regBtn]", options: [], metrics: nil, views: ["maskView":backView,"regBtn":registerBtn]))
        
        
        //设置背景颜色
        backgroundColor = UIColor(white: 0.93, alpha: 1.0)
        
    }
    
    
    
    /*
    加载子视图
    */
    //图片
    private lazy var backView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    //圆圈
    private lazy var circleView: UIImageView  = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    //中间图片
    private lazy var iconView: UIImageView  = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    //提示文案
    private lazy var tipLable: UILabel = {
        let wordLabel = UILabel()
        
        wordLabel.text = "关注一些人，回这里看看有什么惊喜"
        wordLabel.textColor = UIColor.darkGrayColor()
        
        wordLabel.font = UIFont.systemFontOfSize(14.0)
        wordLabel.numberOfLines = 0

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
        
        registerBtn.setTitle("注册", forState: .Normal)
        registerBtn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState:.Normal)
        registerBtn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        
        registerBtn.sizeToFit()
        
        return registerBtn
        }()

    
}
