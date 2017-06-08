//
//  ShowAlertViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/8.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class ShowAlertViewController: BaseViewController {

    
    public var showImageView = UIImageView()
    
    private var privateImage = UIImageView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let blur = UIBlurEffect.init(style: UIBlurEffectStyle.extraLight)
        
        let effectview = UIVisualEffectView.init(effect: blur)
        
        effectview.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        
        self.view.backgroundColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0)
        
        
        let rect = self.view.getRelativewindowFrame(view: self.showImageView)
        
        
    }


}
