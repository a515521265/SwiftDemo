//
//  MainTabBarViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/2.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self as? UITabBarControllerDelegate;
        // Do any additional setup after loading the view.
        let nav1 = MainNavViewController.init(rootViewController: HomeViewController());
        settabBar(nav: nav1, title: "推荐", image: "common-tuijianno", selectedImage: "common-tuijian")
        let nav2 = MainNavViewController.init(rootViewController: ProductViewController());
        settabBar(nav: nav2, title: "产品", image: "common-productno", selectedImage: "common-product")
        let nav3 = MainNavViewController.init(rootViewController: ViewController());
        settabBar(nav: nav3, title: "发现", image: "common-faxianno", selectedImage: "common-faxian")
        let nav4 = MainNavViewController.init(rootViewController: ViewController());
        settabBar(nav: nav4, title: "账户", image: "common-accountno", selectedImage: "common-account")
        let nav5 = MainNavViewController.init(rootViewController: ViewController());
        settabBar(nav: nav5, title: "更多", image: "common-moreno", selectedImage: "common-more")
        
        
    }

    
    func settabBar(nav:UINavigationController,title:String,image:String,selectedImage:String)  {
        self.addChildViewController(nav)
        
        nav.tabBarItem = UITabBarItem.init(title: title, image: UIImage.init(named: image), selectedImage: UIImage.init(named: selectedImage));
        nav.tabBarItem.image = UIImage.init(named: image)
        nav.tabBarItem.selectedImage = UIImage.init(named: selectedImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        
        let textAttrs1 = NSMutableDictionary()
        textAttrs1[NSForegroundColorAttributeName] = UIColor.orange
        
        let textAttrs2 = NSMutableDictionary()
        textAttrs2[NSForegroundColorAttributeName] = UIColor.gray
        
        nav.tabBarItem.setTitleTextAttributes(textAttrs2 as? [String : Any], for: UIControlState.normal)
        nav.tabBarItem.setTitleTextAttributes(textAttrs1 as? [String : Any], for: UIControlState.selected)
        
        
    }
    
}
