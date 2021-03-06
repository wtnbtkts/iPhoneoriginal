//
//  ViewController.swift
//  iPhone_0704
//
//  Created by Takatoshi Watanabe on 2015/06/17.
//  Copyright (c) 2015年 渡辺 貴俊. All rights reserved.
//

import UIKit
import AVFoundation

class riceoutResultViewController: UIViewController, UIPickerViewDelegate,AVAudioPlayerDelegate {
    
    var audioPlayer : AVAudioPlayer!
    var soundCount:Int=0
    var filenames:[String] = ["miss2"]
    
    //時間計測用の変数.
    var cnt : Float = 5
    
    //時間表示用のラベル.
    var myLabel : UILabel!
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var seikai: UILabel!

    
    var score : Int!
    
    @IBOutlet var mylabel2 : UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        score = appDelegate.ViewVal //scorekekkaにscore4の値を引き渡す
        mylabel2.text = "予算\(score)円！"
        mylabel2.textColor = UIColor.redColor()
        println("score\(score)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.ViewVal = score //scorekekkaの値を引き渡す
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            println("score\(score)")
            
            // Do any additional setup after loading the view.
        
        // 配置する座標を設定する.
        mylabel2.layer.position = CGPoint(x: self.view.bounds.width/2,y: 10)
    }
    
    // 結果をメールに送る
    @IBAction func share2(sender: UIButton) {
        
        // 共有する項目
        let shareText = "今日のご飯はそばセットにしよう！\n19:00に△△集合！\n"
        let shareWebsite = NSURL(string: "https://life-is-tech.com/")!
        let shareImage = UIImage(named: "soba.jpg")!
        
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
    
    func playerWithFilename(filenames:String) -> AVAudioPlayer {
        let soundFilePath = NSBundle.mainBundle().pathForResource(filenames, ofType: "mp3")
        let fileURL : NSURL = NSURL(fileURLWithPath:soundFilePath!)!
        
        
        //AVAudioPlayerのインスタンス化.!
        return AVAudioPlayer(contentsOfURL: fileURL, error: nil)
    }
    
    @IBAction func playButton(){
        //audioPlayer = playerWithFilename(filenames)
        audioPlayer = playerWithFilename(filenames[soundCount])
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }
}


/*
override func viewWillAppear(animated: Bool) {
super.viewDidDisappear(animated)
var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
score = appDelegate.ViewVal //scorekekkaにscore4の値を引き渡す
mylabel2.text = "予算\(score)円！"
println("score\(score)")
}

override func viewWillDisappear(animated: Bool) {
super.viewDidDisappear(animated)
var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
appDelegate.ViewVal = score //scorekekkaの値を引き渡す
}
*/


    