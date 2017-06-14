//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/2.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,CAAnimationDelegate {

    var window: UIWindow?

    var blueView = UIView()
    
    var color = UIColor.clear.cgColor
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window?.rootViewController = MainTabBarViewController();
        
        self.window?.layer.cornerRadius = 10;
        
        self.window?.clipsToBounds = true;
        
        delay(0.5,task: {
            self.blueView.isUserInteractionEnabled = false;
            self.blueView.layer.cornerRadius = 10;
            self.blueView.layer.borderColor = self.color
            self.blueView.layer.borderWidth = 3;
            self.blueView.layer.masksToBounds = true
            self.blueView.clipsToBounds = true;
            self.blueView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
            self.blueView.backgroundColor = UIColor.clear
            UIApplication.shared.keyWindow?.addSubview(self.blueView)
        })
        
        // 创建定时器
        let timer:Timer = Timer(timeInterval: 2.0,
                                    target: self,
                                    selector: #selector(updateTimer),
                                    userInfo: nil,
                                    repeats: true)
        
        // 将定时器添加到运行循环
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)

        return true
        
    }
    
    
    func updateTimer(){

        let colorAnim = CABasicAnimation(keyPath: "borderColor")
        colorAnim.fromValue = UIColor.clear.cgColor
        colorAnim.toValue = getRandomColor().cgColor
        colorAnim.autoreverses = true
        colorAnim.repeatCount = Float.infinity
        colorAnim.duration = 1
        colorAnim.delegate = self;
        self.blueView.layer.add(colorAnim, forKey: "colorAnim")

    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
