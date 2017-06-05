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
        return sv;
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加控件位置偏差
//        self.automaticallyAdjustsScrollViewInsets = false;

        self.view.addSubview(scrollerView);
        
        
        let lab1 = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 90));
        lab1.text = "label1"
        lab1.textAlignment = NSTextAlignment.center;
        lab1.backgroundColor = UIColor.red
        
        
        let lab2 = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 130));
        lab2.text = "label2"
        lab2.textAlignment = NSTextAlignment.center;
        lab2.backgroundColor = UIColor.yellow
        
        let lab3 = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 50));
        lab3.text = "label3"
        lab3.textAlignment = NSTextAlignment.center;
        lab3.backgroundColor = UIColor.red
        
        self.scrollerView.setScrollerviewSubViewsArr(views: [lab1,lab2,lab3])
        

        self.scrollerView.tapSelectRow = {(row) in
            
            print(row);
        }

        
        
        
    }
    
}
