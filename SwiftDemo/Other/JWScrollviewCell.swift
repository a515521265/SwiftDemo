//
//  JWScrollviewCell.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/5.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

//定义block
typealias click = (Void) -> Void

class JWScrollviewCell: UIView {
    
    public var _isGestureEnabled = Bool()
    
    public var click : click?
    
    //private
    private var upLine = UILabel()
    
    private var downLine = UILabel()
    
    private var clickButton = UIButton()
    
    
    //lazy
    lazy var rightImage = { () -> UIImageView in 
    
        let rightImage = UIImageView.init(frame: CGRect.init(x: self.width-(15+8), y: (self.height - 13)/2, width: 8, height: 13))
        
        rightImage.image = UIImage.init(named: "arrow_forward")
        
        return rightImage
        
    }
    
    
    lazy var contentView : UIView = { () -> UIView in
    
        let contentView = UIView.init()
        
        contentView.backgroundColor = UIColor.white
        
        return contentView
        
    }()
    
    lazy var leftLabel = { () -> UILabel in
        
        let leftLabel = UILabel.init(frame: CGRect.init(x: 15, y: 0, width: kScreenWidth/2-20, height: self.contentView.height))
        
        self.contentView.addSubview(leftLabel)
        
        return leftLabel
        
        
    }
    
    
    lazy var rightTextField = { () -> UITextField in
        
        let rightTextField = UITextField.init(frame: CGRect.init(x: kScreenWidth/2, y: 0, width: kScreenWidth/2-20, height: self.contentView.height))
        
        rightTextField.textAlignment = NSTextAlignment.right
        
        self.contentView.addSubview(rightTextField)
        
        return rightTextField
        
        
    }
    
    
    //重写initframe方法
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.height = frame.size.height + 2
        
        self.upLine = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 1))
        
        self.addSubview(self.upLine)
        
        self.downLine = UILabel.init(frame: CGRect.init(x: 0, y: self.height-1, width: kScreenWidth, height: 1))
        
        self.addSubview(self.downLine)
        
        self.contentView.frame = CGRect.init(x: 0, y: self.upLine.bottom, width: kScreenWidth, height: self.height-self.upLine.height-self.downLine.height)
        
        self.addSubview(self.contentView);
        
    }
    //重写initframe 自动生成的代码 不知道是干啥的。。。。
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setLineColor(lineColor:UIColor)  {
        
        self.downLine.backgroundColor = lineColor
        
        self.upLine.backgroundColor = lineColor
        
    }
    
    
    func setUPandDownSpacing(upSpacing:CGFloat,downSpacing:CGFloat) {
        
        self.upLine.height = upSpacing
        
        self.downLine.height = downSpacing
        
        self.refreshSubviews()
        
    }
    
    
    func refreshSubviews()  {
        
        self.contentView.y = self.upLine.bottom
        
        self.downLine.y = self.contentView.bottom
        
        self.height = self.downLine.bottom
        
    }
    
    
    func getElementByTag(viewTag:NSInteger) -> UIView {
        
        return UIView();
        
    }
    
    
    var isGestureEnabled: Bool?{
    
        set{
            _isGestureEnabled = (newValue != nil)
            
            if self.isGestureEnabled! {
                self.clickButton.frame = CGRect.init(x: 0, y: 0, width: self.contentView.width, height: self.contentView.height)
                
//                self.clickButton.addSingleTapEvent({ 
//                    print("------")
//                })
                
                self.contentView.addSubview(self.clickButton)
                
            }else{
            
            }
            
        }
        get{
            return _isGestureEnabled
        }
        
    }
    
    
    
    
}
