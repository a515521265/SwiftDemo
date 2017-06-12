//
//  Single.swift
//  SwiftDemo
//
//  Created by 恒善信诚科技有限公司 on 2017/6/12.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class Single: NSObject {
    
    public var _name = String()

    static let shared = Single()
    
    private override init() {}
    
    
    
    public var name :String?{
    
        set{
            _name = newValue!
            //这么写的话不知道synchronize()方法怎么执行。。。
            UserDefaults.standard.setValue(_name, forKey: "UserNameKey")
        }get{
        
            let str = UserDefaults.standard.object(forKey: "UserNameKey") as? String ?? ""
            
            return str
            
        }
        
    }
    
}
