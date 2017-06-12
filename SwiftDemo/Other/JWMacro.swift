//
//  JWMacro.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/2.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import Foundation
import UIKit

let kScreenFrame = UIScreen.main.bounds
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height


//blcoks
typealias cellClick = (UIImageView) -> Void
typealias tapSelectRow = (NSInteger) -> ()
typealias click = (Void) -> Void



func getRandomColor() -> UIColor {
    
    let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
    let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
    let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
    let colorRun = UIColor.init(red:red, green:green, blue:blue , alpha: 1)

    return colorRun
    
}
