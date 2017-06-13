//
//  FindViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/6.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class FindViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    let tabView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.grouped)
    
    var dataArr = Array<CustomCellModel>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabView.dataSource = self;
        tabView.delegate = self;
        tabView.separatorStyle = UITableViewCellSeparatorStyle.none
        view.addSubview(tabView);
        
        let model1 = CustomCellModel()
        model1.list = ["","","","","",""]
        
        
        let model2 = CustomCellModel()
        model2.list = ["","","",""]

        
        let model3 = CustomCellModel()
        model3.list = ["","","",""]

        
        let model4 = CustomCellModel()
        model4.list = ["","",""]

        dataArr.append(model1)
        dataArr.append(model2)
        dataArr.append(model3)
        dataArr.append(model4)
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID : String = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! CustomTableViewCell!
        
        if(cell == nil)
        {
            cell = CustomTableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellID)
        }
//        cell?.cellModel = dataArr[indexPath.row]
        cell?.setcellModel(model: dataArr[indexPath.row])
        cell?.textLabel?.textColor = UIColor.black
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        cell?.tapCell = {(imagev) in
            let showVC = ShowAlertViewController()
            showVC.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            showVC.modalPresentationStyle = UIModalPresentationStyle.custom
            showVC.showImageView = imagev
            self.present(showVC, animated: true, completion: nil)
        }
        return cell!;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellm = dataArr[indexPath.row]
        return cellm.cellHeight;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(dataArr[indexPath.row]);
        
        //        tabView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.none)
        //取消选定cell
        
        //测试提交
//        tabView.deselectRow(at: indexPath, animated: true);
        
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    

    
    
    

}
