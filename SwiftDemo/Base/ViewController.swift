//
//  ViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/2.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: BaseViewController {

    var dynamicAnimator = UIDynamicAnimator()
    
    var imgArr = Array<UIView>();
    
    let motionManager = CMMotionManager()
    
    var gravityBehavior = UIGravityBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white;
        

        motionManager.accelerometerUpdateInterval = 1/60
        
        if(motionManager.isAccelerometerAvailable)
        {
            let queue = OperationQueue.current
            
            motionManager.startDeviceMotionUpdates(to: queue!, withHandler: { (motion, error) in
                
                let rotation = atan2((motion?.attitude.pitch)!, (motion?.attitude.roll)!);
                self.gravityBehavior.angle = CGFloat(rotation);
                
            })
            
        }

        
        for i in 0...20 {
            
            let a = i / 4
            
            let b = i % 4
            
            let imageb = UIImageView.init(frame: CGRect.init(x: 10 + CGFloat(Float(b)) * 50, y: 20+(CGFloat(Float(a)) * 50), width: 50, height: 50))
            imageb.image = UIImage.init(named: "github2")
            
            self.view.addSubview(imageb)
            
            imgArr.append(imageb)
            
        }
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        self.testfunc()
        
        
    }


    
    func testfunc()  {
        //创建并添加重力行为
        self.gravityBehavior = UIGravityBehavior(items: self.imgArr)
        dynamicAnimator.addBehavior(gravityBehavior)
        
        //创建并添加碰撞行为
        let collisionBehavior = UICollisionBehavior(items: self.imgArr)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
    }
    
    
}

