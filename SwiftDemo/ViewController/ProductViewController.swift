//
//  ProductViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/2.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class ProductViewController: BaseViewController {

    let scrollerView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight));
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollerView.alwaysBounceHorizontal = true;
        scrollerView.alwaysBounceVertical = true;
        
        self.view.addSubview(scrollerView);
        
        
        let lab = UILabel.init(frame: CGRect.init(x: 0, y: 140, width: kScreenWidth, height: 30));
        lab.text = "label"
        lab.textAlignment = NSTextAlignment.center;
        scrollerView.addSubview(lab);
        

        
    
    }
    


}
