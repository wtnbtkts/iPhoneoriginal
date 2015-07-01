//
//  ViewController.swift
//  hitnumbers
//
//  Created by Takatoshi Watanabe on 2015/06/22.
//  Copyright (c) 2015年 渡辺 貴俊. All rights reserved.
//

import UIKit

class flashResultViewController: UIViewController {
    
    //スコア
    var score : Int!
    //スコア表示
    @IBOutlet var mylabel2 : UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 配置する座標を設定する.
        mylabel2.layer.position = CGPoint(x: self.view.bounds.width/2,y: 10)
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        score = appDelegate.ViewVal //scorekekkaにscore4の値を引き渡す
        mylabel2.text = "\(score)円獲得！"
        mylabel2.textColor = UIColor.redColor()
        println("score\(score)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.ViewVal = score //scorekekkaの値を引き渡す
    }
    
}
