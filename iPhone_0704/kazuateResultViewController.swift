//
//  ViewController.swift
//  hitnumbers
//
//  Created by Takatoshi Watanabe on 2015/06/22.
//  Copyright (c) 2015年 渡辺 貴俊. All rights reserved.
//

import UIKit
import AVFoundation

class kazuateResultViewController: UIViewController, UIPickerViewDelegate,AVAudioPlayerDelegate {
    var audioPlayer : AVAudioPlayer!
    var soundCount:Int=0
    //var stations = ["わずか、1問正解！", "まあ、2問正解！", "おお、3問正解！", "さすが、4問正解！"]
    //var filenames:[String] = ["dog", "cat", "rain", "wave"]
    var filenames:[String] = ["trumpet1"]
    
    //スコア
    var score : Int!
    //スコア表示
    @IBOutlet var mylabel2 : UILabel!
    
    private var myImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 配置する座標を設定する.
        mylabel2.layer.position = CGPoint(x: self.view.bounds.width/2,y: 10)
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
class kazuateResultViewController: UIViewController {
    var correctAnswer:Int = 0
    
    var cnt : Float = 0
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var seikai: UILabel!
    
    @IBOutlet var myLabel : UILabel!
    
    //スコア
    var score : Int!
    //スコア表示
    @IBOutlet var mylabel2 : UILabel!
    
    private var myImageView: UIImageView!

    
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
    
    
    
}*/
