//
//  JWScrollView.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/5.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

//定义block
typealias tapSelectRow = (NSInteger) -> ()



class JWScrollView: UIScrollView {

    
    
    //定义block
//    typealias tapSelectRow = (NSInteger) -> ()
    
    public var allSubviews = Array<UIView>()
    
    public var paddingHeight = CGFloat()
    
    public var isGestureEnabled = Bool()
    //block变量
    public var tapSelectRow : tapSelectRow?

    private var maxWidth = CGFloat()
    
    private var isAutomaticAdd = Bool()
    
    func setScrollerviewSubViewsArr(views:Array<UIView>)  {
        
        self.allSubviews = views
        
        self.reloadSubViews(views: self.allSubviews)
    }
    
    
    private func reloadSubViews(views:Array<UIView>)  {
        
        if views.count<=0 {
            return
        }
        
        self.isAutomaticAdd = true
        
        let firstView = views.first
        firstView?.tag = 1992
        //莫名其妙的偏移。。。处理一下
        firstView?.y = -(firstView?.height)!
        firstView?.x = (kScreenWidth - (firstView?.width)!)/2
        
        if self.isGestureEnabled {
            
            firstView?.isUserInteractionEnabled = true
            let firstTap = UITapGestureRecognizer.init(target: self, action: #selector(viewTapAction))
            firstTap.numberOfTapsRequired=1
            firstTap.numberOfTouchesRequired = 1
            firstView?.addGestureRecognizer(firstTap)
            
        }
        self.addSubview((firstView)!)
        
    
        /*遍历需要传正向遍历还是倒叙遍历
         enumerated() 正序
         reversed() 倒叙
         */
        for (item,Vieww) in views.enumerated(){
            let view = Vieww
            view.tag = 1992 + item
            view.x = (kScreenWidth - view.width)/2
            if self.isGestureEnabled {
                Vieww.isUserInteractionEnabled = true
                let tap = UITapGestureRecognizer.init(target: self, action: #selector(viewTapAction))
                tap.numberOfTapsRequired=1
                tap.numberOfTouchesRequired = 1
                Vieww.addGestureRecognizer(tap)

            }
            view.y = (self.subviews.last?.y)! + (self.subviews.last?.height)!
            self.addSubview(view);
            
            if item == views.count-1 {
                
                self.contentSize = CGSize.init(width: 0, height: (self.subviews.last?.y)! + (self.subviews.last?.height)! + self.paddingHeight)
                
            }
            
        }
        
    }
    
    func viewTapAction (tap:UITapGestureRecognizer)  {
        
        if tapSelectRow != nil {
            tapSelectRow!((tap.view?.tag)!-1992)
        }
        
    }
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
    
    }
    
    
    func removeViewWithTag(ViewTag:NSInteger)  {
        
        for (index, value) in self.allSubviews.enumerated() {
            if value.tag == ViewTag {
                value.removeFromSuperview()
                self.allSubviews.remove(at: index)
            }
        }
        
        self.reloadSubViews(views: self.allSubviews)
        
    }
    
    func reloadViews()  {
        
        self.reloadSubViews(views: self.allSubviews)
    }
    
    func removeAllSubViews()  {
        
        for (_,value) in self.subviews.enumerated() {
            
            value.removeFromSuperview()
            
        }
        
    }
    
    func allSubViewsClipsToBounds()  {
        
        for (_,value) in self.subviews.enumerated() {
            
            value.clipsToBounds = true
            
        }

    }
    
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        
        if self.isAutomaticAdd {
            return
        }
        
        
        
        
        
    }
    
    
}
