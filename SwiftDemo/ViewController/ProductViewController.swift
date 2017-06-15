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
//        sv.topPaddingHeight = 10
//        sv.bounces = false;
        return sv;
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(scrollerView);
        //轮播图
        self.circleView = CirCleView(frame: CGRect(x: 0, y: 64, width: self.view.frame.size.width, height: 200), imageArray: [])
        circleView.backgroundColor = UIColor.orange
        circleView.delegate = self
        delay(1)  {
            self.circleView.urlImageArray = ["http://a2.qpic.cn/psb?/V14fUnYP0SXDXU/RjNqTMAuvskdaYVmg3NkVlg*JK6owbqyD4.M*ql52ik!/b/dAQAAAAAAAAA&bo=cgcgA.MOQAYFCNY!&rf=viewer_4","http://a1.qpic.cn/psb?/V14fUnYP0SXDXU/1ZZAgz.VFZRKb8Cegre.eZuJJfhjjXjIhG8n.EahULk!/b/dAMAAAAAAAAA&bo=KwQgA0AGsAQFAN0!&rf=viewer_4","http://a2.qpic.cn/psb?/V14fUnYP0SXDXU/xwT4aLFAO.gT32CKLU0o6Q0SmMjmcM0v8WXTb2M6gwI!/b/dAQAAAAAAAAA&bo=KwQgA0AGsAQFAN0!&rf=viewer_4"]
        }
        var arr = Array<UIView>()
        arr.append(circleView)
        for i in 1...15 {
            let cells = JWScrollviewCell.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 50))
            cells.leftLabel().text = "账号".appending(String(i))
            cells.rightTextField().placeholder = "请输入您的账号"
            cells.setLineColor(lineColor: UIColor.groupTableViewBackground)
            cells.setUPandDownSpacing(upSpacing: 0.5, downSpacing: 0.5)
            arr.append(cells);
        }
        self.scrollerView.setScrollerviewSubViewsArr(views: arr)
        
        
        let footer = RHRefreshFooter(refreshScrollView: scrollerView)
        footer.refreshHandler = {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                footer.endRefresh()
                arr.remove(at: 1)
                self.scrollerView.removeViewWithTag(ViewTag: 1993)
            }
        }
        
        let header = RHRefreshHeader(refreshScrollView: scrollerView)
        header.refreshHandler = {
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                header.endRefresh()
                let rView = UIView()
                rView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 50)
                rView.backgroundColor = getRandomColor()
                arr.insert(rView, at: 1)
                self.scrollerView.allSubviews = arr
                UIView.animate(withDuration: 0.5, animations: { 
                    self.scrollerView.reloadViews()
                }, completion: nil)
//                footer.hasMoreData = true
            }
            
        }
        //进入界面手动调用下拉刷新
//        header.beginRefresh()
        
    }
    
    /************************** Delegate Methods *************************************/
    //MARK:- Delegate Methods
    //MARK: CirCleViewDelegate Methods
    
    func clickCurrentImage(_ currentIndxe: Int) {
        print(currentIndxe, terminator: "");
    }

    
}
