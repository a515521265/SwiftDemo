//
//  MoreViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/9.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class MoreViewController: BaseViewController ,UIScrollViewDelegate {

    
    var scrollerView = JWScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
    
    
    var applications: [SystemApplication] = []
    
    
    var page = UIPageControl.init(frame: CGRect.init(x: 0, y: kScreenHeight-100, width: kScreenWidth, height: 30))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollerView.showsVerticalScrollIndicator = false;
        self.scrollerView.showsVerticalScrollIndicator = false;
        self.scrollerView.showsHorizontalScrollIndicator = false;
        self.scrollerView.isPagingEnabled = true;
        self.scrollerView.delaysContentTouches = false;
        self.scrollerView.contentSize = CGSize.init(width: kScreenWidth * 4, height: 0)
        self.scrollerView.delegate = self;


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
        
        GiFHUD.setGifWithImageName("load0.gif")
        GiFHUD.showWithOverlay()
        
        delay(0.5) { 
         
            // Get all apps installed on the device
            self.applications = SystemApplicationManager.sharedManager.allInstalledApplications()
            
            //拆分数组
            let obj : PublicOCFunc = PublicOCFunc()
            //获取views
            var views = Array<Array<SystemApplication>>()
            
            views = obj.splitArray(self.applications, withSubSize: 20) as! Array<Array<SystemApplication>>
            
            
            for (i,item) in views.enumerated() {
                
                let views = UIView.init(frame: CGRect.init(x:CGFloat(i) * kScreenWidth , y: 0, width: kScreenWidth, height: kScreenHeight))
                self.scrollerView.addSubview(views)
                
                for (i,it) in item.enumerated(){
                    
                    let a = i / 4
                    
                    let b = i % 4
                    
                    let backgroundVH = kScreenWidth / 3.8
                    
                    let backgroundVW = (kScreenWidth - 20) / 4
                    
                    let backgroundV = UIImageView.init(frame: CGRect.init(x: 10 + CGFloat(Float(b)) * backgroundVW, y: 20+(CGFloat(Float(a)) * backgroundVH), width: backgroundVW, height: backgroundVH))
                    
                    let imageW = backgroundV.width-30;
                    
                    let imageV = UIImageView.init(frame: CGRect.init(x: (backgroundV.width - imageW)/2, y: 15, width: imageW, height: imageW))
                    imageV.image = it.icon
                    imageV.isUserInteractionEnabled = true
                    //各种循环找出view。。。
//                    imageV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapApp)))
                    //oc混编实现的点击block。。。
                    PublicOCFunc.singleTapAction(imageV, callback: {
                        SystemApplicationManager.sharedManager.openApplication(it)
                    })
                    
                    backgroundV.addSubview(imageV)
                    
                    let titleLba = UILabel.init(frame: CGRect.init(x: 0, y: imageV.bottom, width: backgroundV.width, height: 20))
                    titleLba.text = it.name
                    titleLba.textAlignment = .center
                    titleLba.font = UIFont.systemFont(ofSize: 11)
                    titleLba.textColor = UIColor.white
                    backgroundV.addSubview(titleLba)
                    
                    backgroundV.isUserInteractionEnabled = true
                    views.addSubview(backgroundV)

                }
            }
            self.scrollerView.contentSize = CGSize.init(width: kScreenWidth * CGFloat(views.count) , height: 0)
            self.view.addSubview(self.scrollerView)
            self.page.numberOfPages = views.count
            self.page.addTarget(self, action: #selector(self.pageTurn), for: UIControlEvents.valueChanged)
            self.view.addSubview(self.page)

            GiFHUD.dismiss()
        }
        
        
        
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
    
    
    func tapApp(tap:UIGestureRecognizer)  {
        
        for (_,item) in (tap.view?.superview?.subviews.enumerated())! {
            
            if item is UILabel {
             
                var lab = UILabel()
                
                lab = item as! UILabel;
            
                print(lab.text ?? "")
                
                for (_,it) in self.applications.enumerated() {
                    
                    if lab.text == it.name {
                        SystemApplicationManager.sharedManager.openApplication(it)
                        break
                    }
                    
                }
                
            }
            
        }

    }
    
    
    //scrollview代理
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.page.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.size.width);
    }

    func pageTurn(sender : UIPageControl){
        let viewSize = self.scrollerView.frame.size

        self.scrollerView.setContentOffset(CGPoint.init(x: CGFloat(sender.currentPage) * viewSize.width, y: 0), animated: true)
        
    }
    
    
    
}
