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
        let newView = VisitorLoginView()
//        newView.backgroundColor = UIColor.purpleColor()
        view = newView

    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
