//
//  ProductViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/2.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class ProductViewController: BaseViewController {

    
    let scrollerView = { () -> JWScrollView in 
    
        let sv = JWScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        sv.alwaysBounceVertical = true
        sv.isGestureEnabled = true
        sv.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
        sv.backgroundColor = UIColor.groupTableViewBackground
        sv.topPaddingHeight = 10
        return sv;
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加控件位置偏差
//        self.automaticallyAdjustsScrollViewInsets = false;
        self.view.addSubview(scrollerView);
        
        var arr = Array<UIView>()
        
        for _ in 1...15 {
            let cells = JWScrollviewCell.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 50))
            cells.leftLabel().text = "账号"
            cells.rightTextField().placeholder = "请输入您的账号"
            cells.setLineColor(lineColor: UIColor.groupTableViewBackground)
            cells.setUPandDownSpacing(upSpacing: 0.5, downSpacing: 0.5)
            arr.append(cells);
        }
        self.scrollerView.setScrollerviewSubViewsArr(views: arr)
        
        
        
//        let lab1 = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 90));
//        lab1.text = "label1"
//        lab1.textAlignment = NSTextAlignment.center;
//        lab1.backgroundColor = UIColor.red
//        
//        
//        let lab2 = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 130));
//        lab2.text = "label2"
//        lab2.textAlignment = NSTextAlignment.center;
//        lab2.backgroundColor = UIColor.yellow
//        
//        let lab3 = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 50));
//        lab3.text = "label3"
//        lab3.textAlignment = NSTextAlignment.center;
//        lab3.backgroundColor = UIColor.red
        
//        self.scrollerView.setScrollerviewSubViewsArr(views: [lab1,lab2,lab3,cell1])
        

//        self.scrollerView.tapSelectRow = {(row) in
//            
//            print(row);
//            
//            self.view.endEditing(true)
//            
//        }

        
        
        
    }
    
}
