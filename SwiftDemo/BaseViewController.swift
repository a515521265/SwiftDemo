//
//  BaseViewController.swift
//  SwiftDemo
//
//  Created by 梁家文 on 2017/6/2.
//  Copyright © 2017年 梁家文. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    
    public let object = NSObject()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
    
    }
    

    override var prefersStatusBarHidden : Bool {
    
        get{
            return true
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
