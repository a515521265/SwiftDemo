//
//  MainTabBarViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/2.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController,UITabBarControllerDelegate {

    
    var subV = Array<UIView>()
    
    var selectV = UIView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //先添加图片
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = UIImage()
        let backimageV = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 64))
        backimageV.image = UIImage.init(named: "cm2_btm_bg")
        self.tabBar.addSubview(backimageV)
        
        
        delegate = self
        // Do any additional setup after loading the view.
        let nav1 = MainNavViewController.init(rootViewController: HomeViewController());
        settabBar(nav: nav1, title: "推荐", image: "cm2_btm_icn_account", selectedImage: "cm2_btm_icn_account_prs")
        let nav2 = MainNavViewController.init(rootViewController: ProductViewController());
        settabBar(nav: nav2, title: "产品", image: "cm2_btm_icn_discovery", selectedImage: "cm2_btm_icn_discovery_prs")
        let nav3 = MainNavViewController.init(rootViewController: FindViewController());
        settabBar(nav: nav3, title: "发现", image: "cm2_btm_icn_friend", selectedImage: "cm2_btm_icn_friend_prs")
        let nav4 = MainNavViewController.init(rootViewController: AccountViewController());
        settabBar(nav: nav4, title: "账户", image: "cm2_btm_icn_music", selectedImage: "cm2_btm_icn_music_prs")
        let nav5 = MainNavViewController.init(rootViewController: ViewController());
        settabBar(nav: nav5, title: "更多", image: "cm2_btm_icn_discovery", selectedImage: "cm2_btm_icn_discovery_prs")
        

//        print(self.tabBar.subviews);
        
        var arrs = self.tabBar.subviews;
        //删掉图片
        arrs.remove(at: 0)
        
        for (i,item) in arrs.enumerated() {
            
            let cview = UIView.init(frame: item.frame);
            
            cview.backgroundColor = UIColor.red
            
            cview.x = CGFloat(i) * (kScreenWidth/5);
            
            cview.width = kScreenWidth/5;
            
            cview.height = 6;
            
            cview.y = item.height-5;
            
            self.tabBar.addSubview(cview);
            
            subV.append(cview)
            
        }
        
        self.selectV.backgroundColor = UIColor.yellow
        
        self.selectV.frame = CGRect.init(x: 0, y: (arrs.first?.height)!-5, width: kScreenWidth/5, height: 6)
        
        self.tabBar.addSubview(self.selectV)

    }

    
    func settabBar(nav:UINavigationController,title:String,image:String,selectedImage:String)  {
        self.addChildViewController(nav)
        
        nav.tabBarItem = UITabBarItem.init(title: "", image: UIImage.init(named: image), selectedImage: UIImage.init(named: selectedImage));
        nav.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        nav.tabBarItem.selectedImage = UIImage.init(named: selectedImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        
        let textAttrs1 = NSMutableDictionary()
        textAttrs1[NSForegroundColorAttributeName] = UIColor.orange
        
        let textAttrs2 = NSMutableDictionary()
        textAttrs2[NSForegroundColorAttributeName] = UIColor.gray
        
        nav.tabBarItem.setTitleTextAttributes(textAttrs2 as? [String : Any], for: UIControlState.normal)
        nav.tabBarItem.setTitleTextAttributes(textAttrs1 as? [String : Any], for: UIControlState.selected)
        
        
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        UIView.animate(withDuration: 0.1, animations: { 
            
            self.selectV.frame = self.subV[self.selectedIndex].frame
            
        }, completion: nil)
        
        
        
    }
    
}
