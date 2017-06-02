//
//  HomeViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/2.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController ,UITableViewDelegate,UITableViewDataSource {

    
    let tabView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-(44)), style: UITableViewStyle.grouped)
    
    let dataArr = ["java","object","swift"];
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabView.dataSource = self;
        tabView.delegate = self;
        view.addSubview(tabView);
        
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
        tabView.deselectRow(at: indexPath, animated: true);
        
        
    }
    


    
}
