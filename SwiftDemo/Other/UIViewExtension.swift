//
//  UIViewExtension.swift
//  CustomView_IOS
//
//  Created by 梁家文 on 2017/5/31.
//
//

import Foundation
import UIKit




extension UIButton {
    
    
    class func creatButton(imageName:String, title:String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage.init(named: imageName), for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        return button
    }
    
}

//延迟执行封装

typealias Task = (_ cancel : Bool) -> Void

    func delay(_ time: TimeInterval, task: @escaping ()->()) ->  Task? {
        
        func dispatch_later(block: @escaping ()->()) {
            let t = DispatchTime.now() + time
            DispatchQueue.main.asyncAfter(deadline: t, execute: block)
        }
        var closure: (()->Void)? = task
        var result: Task?
        
        let delayedClosure: Task = {
            cancel in
            if let internalClosure = closure {
                if (cancel == false) {
                    DispatchQueue.main.async(execute: internalClosure)
                }
            }
            closure = nil
            result = nil
        }
        
        result = delayedClosure
        
        dispatch_later {
            if let delayedClosure = result {
                delayedClosure(false)
            }
        }
        return result
    }

    func cancel(_ task: Task?) {
        task?(true)
    }

/*****使用*****/
//调用
//delay(2) { print("2 秒后输出") }
//取消
//let task = delay(5) { print("拨打 110") }
// 仔细想一想..
// 还是取消为妙..
//cancel(task)


//延迟执行封装


extension UIView {
    
//    typealias singleTapEvent1 = (Void) -> Void
//    
//    public var singleTapEvent = singleTapEvent1()
    
    // x
    var x : CGFloat {
        
        get {
            
            return frame.origin.x
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.origin.x     = newVal
            frame                 = tmpFrame
        }
    }
    
    // y
    var y : CGFloat {
        
        get {
            
            return frame.origin.y
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.origin.y     = newVal
            frame                 = tmpFrame
        }
    }
    
    // height
    var height : CGFloat {
        
        get {
            
            return frame.size.height
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }
    
    // width
    var width : CGFloat {
        
        get {
            
            return frame.size.width
        }
        
        set(newVal) {
            
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }
    
    // left
    var left : CGFloat {
        
        get {
            
            return x
        }
        
        set(newVal) {
            
            x = newVal
        }
    }
    
    // right
    var right : CGFloat {
        
        get {
            
            return x + width
        }
        
        set(newVal) {
            
            x = newVal - width
        }
    }
    
    // top
    var top : CGFloat {
        
        get {
            
            return y
        }
        
        set(newVal) {
            
            y = newVal
        }
    }
    
    // bottom
    var bottom : CGFloat {
        
        get {
            
            return y + height
        }
        
        set(newVal) {
            
            y = newVal - height
        }
    }
    
    var centerX : CGFloat {
        
        get {
            
            return center.x
        }
        
        set(newVal) {
            
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    
    var centerY : CGFloat {
        
        get {
            
            return center.y
        }
        
        set(newVal) {
            
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    var middleX : CGFloat {
        
        get {
            
            return width / 2
        }
    }
    
    var middleY : CGFloat {
        
        get {
            
            return height / 2
        }
    }
    
    var middlePoint : CGPoint {
        
        get {
            
            return CGPoint(x: middleX, y: middleY)
        }
    }
    
    
    public func addSingleTapEvent(_: ()->Void)  {
        
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(singleTapAction))
        tap.numberOfTapsRequired=1
        tap.numberOfTouchesRequired = 1
        self.addGestureRecognizer(tap)
        
    }
    
    func getElementByTag(viewTag:NSInteger) -> UIView {
        
        for (_,item) in self.subviews.enumerated() {
            if item.tag == viewTag {
                return item
            }
        }
        return UIView();
        
    }

    
    func getRelativewindowFrame(view:UIView) -> CGRect{
        
        let window = UIApplication.shared.keyWindow
        
        let relativeframe = view.convert(view.bounds, to: window)
        
        return relativeframe
        
    }
    
    
    
    func singleTapAction() {

//        if singleTapEvent != nil {
//                
//            singleTapEvent!()
//           
//        }


    }

}
