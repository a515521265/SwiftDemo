//
//  HomeViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/2.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController ,UITableViewDelegate,UITableViewDataSource {

    
    let tabView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.grouped)
    
    let dataArr = ["Java","Object-C","Swift","Html","Css","JavaScript"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabView.dataSource = self;
        tabView.delegate = self;
        
        let headImageV = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenWidth))
//        headImageV.image = UIImage.gif(name: "load0")
        headImageV.image = UIImage.init(named: "IMG_3076")
        
        let image2 = UIImageView.init(frame: headImageV.frame)
        image2.image = UIImage.init(named: "ele_sunnySunshine")
        
//        headImageV.addSubview(image2);
        
        tabView.tableHeaderView = headImageV
        
        
        view.addSubview(tabView);
        
        
        let sin = Single.shared
        sin.name = "keys"
//        print("homeVC------name"+sin.name!)
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellID : String = "cell"

        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as UITableViewCell!

        if(cell == nil)
        {
            cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellID)
        }
        cell?.textLabel?.textColor = UIColor.black
        cell?.textLabel?.text = dataArr[indexPath.row]
        return cell!;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(dataArr[indexPath.row]);
        
//        tabView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
        //取消选定cell
        
        //测试提交
        tabView.deselectRow(at: indexPath, animated: true);
        
        
    }
    


    
}
