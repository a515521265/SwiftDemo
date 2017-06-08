//
//  CustomTableViewCell.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/6.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {


    public var tapCell : cellClick?
    
    public var cellModel = CustomCellModel()
    
    public func setcellModel(model : CustomCellModel)  {
        
        self.cellModel = model;
        
        for v in self.subviews {
            v.removeFromSuperview()
        }
        
        
        for (i,_) in model.list.enumerated(){
            
            let a = i / 5
            
            let b = i % 5
            
            let colorV = UIImageView.init(frame: CGRect.init(x: CGFloat(Float(b)) * kScreenWidth / 5, y: (CGFloat(Float(a)) * kScreenWidth / 5), width: kScreenWidth / 5, height: kScreenWidth / 5))
            
            let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
            let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
            let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
            let colorRun = UIColor.init(red:red, green:green, blue:blue , alpha: 1)
            colorV.image = UIImage.init(named: "github")
            colorV.backgroundColor = colorRun
            colorV.isUserInteractionEnabled = true
            colorV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(callback)))
            
            self.addSubview(colorV)
            
        }
        
        model.cellHeight = (self.subviews.last?.bottom)!

    }

    
    func callback(tap:UIGestureRecognizer){
        
        if tapCell != nil {
            tapCell!(tap.view as! UIImageView)
        }
        
    }

    
    

}
