//
//  MoreViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/9.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class MoreViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        self.view.backgroundColor
        
        let backgroundImgV = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        
        backgroundImgV.image = UIImage.init(named: "bg_fog_day")
        
        self.view.addSubview(backgroundImgV)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
