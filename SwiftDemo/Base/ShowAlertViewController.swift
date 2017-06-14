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
        
        let logoimage = UIImageView.init(frame: rect)
        
        logoimage.image = self.showImageView.image
        
        self.view.addSubview(logoimage)
        
        self.privateImage = logoimage
        
        delay(0.1) {
            
            UIView.animate(withDuration: 0.5, animations: { 
                
                let x = (kScreenWidth - (self.showImageView.image?.size.width)!)/2
                
                let y = (kScreenHeight - (self.showImageView.image?.size.height)!)/2
                
                let w = (self.showImageView.image?.size.width)!
                
                let h = (self.showImageView.image?.size.height)!
                
                logoimage.frame = CGRect.init(x: x, y: y, width: w, height: h)
                self.view.backgroundColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.4)
                
                self.showImageView.isHidden = true
                
            }, completion: { (Bool) in
                
            })
            
        }
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didmissVC)))
        
        
    }
    
    
    func didmissVC()  {
        
        let rect = self.view.getRelativewindowFrame(view: self.showImageView)
        
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.privateImage.frame = rect
            self.view.backgroundColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.0)
            
        }, completion: { (Bool) in
            
            self.showImageView.isHidden = false
            
            self.dismiss(animated: true, completion: { 
                
            })
        })
        
    }


}
