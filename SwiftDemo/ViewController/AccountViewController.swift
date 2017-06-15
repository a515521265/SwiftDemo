//
//  AccountViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/9.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class AccountViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    
    var tabView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.grouped)
    
    var dataArr = Array<FriendModel>();
    
    var reload = Bool()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabView.dataSource = self;
        tabView.delegate = self;
        view.addSubview(tabView);
        
        var arr = Array<Any>();
        
        
        arr = [["title" : "小学同学",
                "contentS" : ["哈哈哈","嘿嘿嘿"],
                "isShow" : false,
                "headIcon" : "dinosaur"],
               
               
               ["title" : "初中同学",
                "contentS" : ["呵呵呵","嘻嘻嘻"],
                "isShow" : false,
                "headIcon" : "github"],
               
               ["title" : "高中同学",
                "contentS" : ["吃吃吃","喝喝喝"],
                "isShow" : false,
                "headIcon" : "dinosaur"],
               ["title" : "大学同学",
                "contentS" : ["玩玩玩","乐乐乐"],
                "isShow" : false,
                "headIcon" : "github"]
        ]
        
        for (_,item) in arr.enumerated() {
            
            let model = FriendModel.parse(dict:item as! NSDictionary)
            
            dataArr.append(model)
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID : String = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as UITableViewCell!
        
        if(cell == nil)
        {
            cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellID)
        }
        cell?.textLabel?.textColor = UIColor.black
        
        let model =  dataArr[indexPath.section]
        cell?.imageView?.image = UIImage.init(named: model.headIcon)
        cell?.textLabel?.text = model.contentS[indexPath.row]
        return cell!;
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        
        view.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 50)
        
        let jwlab : JWLabel = JWLabel()
        jwlab.frame = CGRect.init(x: 20, y: 0, width: kScreenWidth-40, height: 50);
        
        let dict = dataArr[section]
        
        jwlab.labelAnotherColor = UIColor.gray
        
        jwlab.text = dict.title.appending("<(24/88)>")
        
        jwlab.canPerformCopyAction = true
        
        jwlab.font = UIFont.boldSystemFont(ofSize: 20)
        
        jwlab.tag = section + 99
        
        jwlab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showCellList)))
        
        jwlab.isUserInteractionEnabled = true
        
        view.addSubview(jwlab)
        
        
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if reload == false {
            return 0
        }
        let model = dataArr[section]
        if model.isShow == false {
            return 0
        }
        return model.contentS.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(dataArr[indexPath.row]);
        
        //        tabView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
        //取消选定cell
        
        //测试提交
        tabView.deselectRow(at: indexPath, animated: true);
        
    }
    
    
    func showCellList(tap:UIGestureRecognizer)  {
        
        reload = true
        
        let indexs = (tap.view?.tag)! - 99
        
        let model = dataArr[indexs]
        
        model.isShow = !model.isShow
        
        self.tabView.reloadSections(NSIndexSet(index: indexs) as IndexSet, with: UITableViewRowAnimation.fade)
        
    }


}
