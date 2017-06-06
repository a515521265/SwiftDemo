//
//  ProductViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/2.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class ProductViewController: BaseViewController ,CirCleViewDelegate{

    
    var circleView = CirCleView()
    
    let scrollerView = { () -> JWScrollView in 
    
        let sv = JWScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        sv.alwaysBounceVertical = true
        sv.isGestureEnabled = true
        sv.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
        sv.backgroundColor = UIColor.groupTableViewBackground
        sv.topPaddingHeight = 10
        return sv;
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加控件位置偏差
//        self.automaticallyAdjustsScrollViewInsets = false;
        self.view.addSubview(scrollerView);
        
        
//        let imageArray: [UIImage?] = [UIImage(named: "first.jpg"), UIImage(named: "second.jpg"), UIImage(named: "third.jpg")]
        
        self.circleView = CirCleView(frame: CGRect(x: 0, y: 64, width: self.view.frame.size.width, height: 200), imageArray: [])
        circleView.backgroundColor = UIColor.orange
        circleView.delegate = self
//        self.view.addSubview(circleView)
        
        delay(2)  {
            self.circleView.urlImageArray = ["http://a2.qpic.cn/psb?/V14fUnYP0SXDXU/RjNqTMAuvskdaYVmg3NkVlg*JK6owbqyD4.M*ql52ik!/b/dAQAAAAAAAAA&bo=cgcgA.MOQAYFCNY!&rf=viewer_4","http://a1.qpic.cn/psb?/V14fUnYP0SXDXU/1ZZAgz.VFZRKb8Cegre.eZuJJfhjjXjIhG8n.EahULk!/b/dAMAAAAAAAAA&bo=KwQgA0AGsAQFAN0!&rf=viewer_4","http://a2.qpic.cn/psb?/V14fUnYP0SXDXU/xwT4aLFAO.gT32CKLU0o6Q0SmMjmcM0v8WXTb2M6gwI!/b/dAQAAAAAAAAA&bo=KwQgA0AGsAQFAN0!&rf=viewer_4"]
        }
        

        
        var arr = Array<UIView>()
        
        arr.append(circleView)
        
        for _ in 1...15 {
            let cells = JWScrollviewCell.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 50))
            cells.leftLabel().text = "账号"
            cells.rightTextField().placeholder = "请输入您的账号"
            cells.setLineColor(lineColor: UIColor.groupTableViewBackground)
            cells.setUPandDownSpacing(upSpacing: 0.5, downSpacing: 0.5)
            arr.append(cells);
        }
        self.scrollerView.setScrollerviewSubViewsArr(views: arr)
        
        
        
//        let lab1 = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 90));
//        lab1.text = "label1"
//        lab1.textAlignment = NSTextAlignment.center;
//        lab1.backgroundColor = UIColor.red
//        
//        
//        let lab2 = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 130));
//        lab2.text = "label2"
//        lab2.textAlignment = NSTextAlignment.center;
//        lab2.backgroundColor = UIColor.yellow
//        
//        let lab3 = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 50));
//        lab3.text = "label3"
//        lab3.textAlignment = NSTextAlignment.center;
//        lab3.backgroundColor = UIColor.red
        
//        self.scrollerView.setScrollerviewSubViewsArr(views: [lab1,lab2,lab3,cell1])
        

//        self.scrollerView.tapSelectRow = {(row) in
//            
//            print(row);
//            
//            self.view.endEditing(true)
//            
//        }

        
        
        
    }
    
    /************************** Delegate Methods *************************************/
    //MARK:- Delegate Methods
    //MARK: CirCleViewDelegate Methods
    
    func clickCurrentImage(_ currentIndxe: Int) {
        print(currentIndxe, terminator: "");
    }

    
}
