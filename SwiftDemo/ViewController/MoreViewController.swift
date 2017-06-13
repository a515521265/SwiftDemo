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
