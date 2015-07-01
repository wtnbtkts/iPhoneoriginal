//
//  ViewController2.swift
//  iPhone_0704
//
//  Created by Takatoshi Watanabe on 2015/06/25.
//  Copyright (c) 2015年 渡辺 貴俊. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var payment: UITextField!
    @IBOutlet weak var persons: UITextField!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet var myTap: UITapGestureRecognizer!
    var message: String!
    
    
    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(myTap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 1人あたりの金額の計算と結果表示
    @IBAction func calcAverage(sender: UIButton) {
        var sum = payment.text.toInt()
        var number = persons.text.toInt()
        
        println(sum! / number!)
        //answer.text = "\(((sum! / number!)+1).description)円"
        //message = "\(sum! / number!)円を準備してください"
        answer.text = "一人当たり\((sum! / number!)+1)円だよ！！"
    }
    
    // 結果をリセット
    @IBAction func resetValue(sender: UIButton) {
        payment.text = ""
        persons.text = ""
        answer.text = ""
        message = ""
    }
    
    // 結果をLINEに送る
    @IBAction func share(sender: UIButton) {
        
        // 共有する項目
        let shareText = "Life is Tech!"
        let shareWebsite = NSURL(string: "https://life-is-tech.com/")!
        let shareImage = UIImage(named: "nabe.png")!
        
        let activityItems = [shareText, shareWebsite, shareImage]
        
        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
            UIActivityTypePostToWeibo,
            UIActivityTypeSaveToCameraRoll,
            UIActivityTypePrint
        ]
        
        activityVC.excludedActivityTypes = excludedActivityTypes
        
        // UIActivityViewControllerを表示
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
    
    
    
    /*
    @IBAction func sendLine(sender: UIButton) {
        if message != nil {
            var encodeMessage: String! = message.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            var messageURL: NSURL! = NSURL(string: "line://msg/text/" + encodeMessage)
            
            
            if (UIApplication.sharedApplication().canOpenURL(messageURL)) {
                UIApplication.sharedApplication().openURL(messageURL)
            }
        } else {
            println("メッセージがありません")
        }
    }
    */
}