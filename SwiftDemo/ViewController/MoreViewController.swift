//
//  MoreViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/9.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class MoreViewController: BaseViewController {

    
    var scrollerView = JWScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollerView.showsVerticalScrollIndicator = false;
        self.scrollerView.showsVerticalScrollIndicator = false;
        self.scrollerView.showsHorizontalScrollIndicator = false;
        self.scrollerView.isPagingEnabled = true;
        self.scrollerView.delaysContentTouches = false;
        self.scrollerView.contentSize = CGSize.init(width: kScreenWidth * 4, height: 0)


        //背景图片
        let backgroundImgV = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        backgroundImgV.image = UIImage.init(named: "bg_fog_day")
        self.view.addSubview(backgroundImgV)
        
        
        //小鸟
        let birdImageView  = UIImageView.init(frame: CGRect.init(x: 0, y: kScreenWidth * 0.8, width: 70/2, height: 52/2))
        birdImageView.animationImages = self.birdImages
        birdImageView.animationRepeatCount = 0
        birdImageView.animationDuration = 1
        birdImageView.startAnimating()
        birdImageView.layer.add(viewTranslationAnimation(toVlaue: kScreenWidth, duration: 20), forKey: nil)
        backgroundImgV.addSubview(birdImageView)
        
        //🌞
        
        let sun = UIImageView.init(frame: CGRect.init(x: kScreenWidth-120, y: 80, width: 90, height: 90))
        sun.image = UIImage.init(named: "0")
        sun.layer.add(viewRotateAnimation(toVlaue: kScreenWidth, duration: 30), forKey: nil)
        backgroundImgV.addSubview(sun)
        
        
        
        let apps = ["QQ","微信","膜拜单车","QQ","微信","膜拜单车","QQ","微信","膜拜单车"]
        
        
        
        
        for i in 0...3 {
            
            let views = UIView.init(frame: CGRect.init(x:CGFloat(i) * kScreenWidth , y: 0, width: kScreenWidth, height: kScreenHeight))
//                views.backgroundColor = getRandomColor()
//            views.alpha = 0.2
            self.scrollerView.addSubview(views)
            
            for (i,_) in apps.enumerated(){
                
                let a = i / 4
                
                let b = i % 4
                
                let colorV = UIImageView.init(frame: CGRect.init(x: CGFloat(Float(b)) * kScreenWidth / 4, y: 20+(CGFloat(Float(a)) * kScreenWidth / 4), width: kScreenWidth / 4, height: kScreenWidth / 4))
                
                let imageV = UIImageView.init(frame: CGRect.init(x: 25, y: 15, width: colorV.width-50, height: colorV.width-50))
                imageV.image = UIImage.init(named: "github")
                colorV.addSubview(imageV)
                
                let titleLba = UILabel.init(frame: CGRect.init(x: 0, y: imageV.bottom, width: colorV.width, height: 20))
                titleLba.text = apps[i]
                titleLba.textAlignment = .center
                titleLba.font = UIFont.systemFont(ofSize: 12)
                colorV.addSubview(titleLba)
                
                colorV.isUserInteractionEnabled = true
                views.addSubview(colorV)
                
            }

            
            
            
            
        }
        
        self.view.addSubview(self.scrollerView)
        
        
        
        
        
        
    }

    /// 平移动画
    fileprivate func viewTranslationAnimation(toVlaue: Any, duration: CFTimeInterval) -> CABasicAnimation {
        let tranAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        tranAnimation.duration = duration
        tranAnimation.toValue = toVlaue
        tranAnimation.repeatCount = MAXFLOAT
        tranAnimation.isRemovedOnCompletion = false;
        tranAnimation.fillMode = kCAFillModeForwards
        return tranAnimation
    }
    
    fileprivate func viewRotateAnimation(toVlaue: Any, duration: CFTimeInterval) -> CABasicAnimation {
        let tranAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        tranAnimation.fromValue = 0
        tranAnimation.toValue = Double.pi * 2
        tranAnimation.repeatCount = MAXFLOAT
        tranAnimation.isRemovedOnCompletion = false;
        tranAnimation.duration = duration
        tranAnimation.fillMode = kCAFillModeForwards
        return tranAnimation
    }
    
    
    
    
    /// 鸟动画数组
    fileprivate lazy var birdImages: [UIImage] = {
        var images = [UIImage]()
        for idx in 1..<9 {
            let fileName = "ele_sunnyBird" + String(idx) + ".png"
            guard let filePath = Bundle.main.path(forResource: fileName, ofType: nil),
                let image = UIImage(contentsOfFile: filePath) else { return  images }
            images.append(image)
        }
        return images
    }()

}
