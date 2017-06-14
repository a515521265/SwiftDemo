//
//  MainNavViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/2.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class MainNavViewController: UINavigationController,UINavigationControllerDelegate {

    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        self.delegate = self;

    }

}
