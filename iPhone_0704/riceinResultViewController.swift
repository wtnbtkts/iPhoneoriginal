//
//  ViewController.swift
//  iPhone_0704
//
//  Created by Takatoshi Watanabe on 2015/06/17.
//  Copyright (c) 2015年 渡辺 貴俊. All rights reserved.
//

import UIKit
import AVFoundation

class riceinResultViewController: UIViewController, UIPickerViewDelegate,AVAudioPlayerDelegate {
    
    var audioPlayer : AVAudioPlayer!
    var soundCount:Int=0
    var filenames:[String] = ["miss2"]
    
    //時間計測用の変数.
    var cnt : Float = 5
    
    //時間表示用のラベル.
    var myLabel : UILabel!
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var seikai: UILabel!
    
    //@IBOutlet var myLabel2 : UILabel!
    
    //private var myImageView: UIImageView!
    
    var score : Int!
    
    @IBOutlet var mylabel2 : UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        score = appDelegate.ViewVal //scorekekkaにscore4の値を引き渡す
        mylabel2.text = "予算\(score / 2)円！"
        mylabel2.textColor = UIColor.greenColor()
        println("score\(score)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.ViewVal = score / 2 //scorekekkaの値を引き渡す
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        // UIImageViewを作成する.
        myImageView = UIImageView(frame: CGRectMake(0,0,100,120))
        
        // 表示する画像を設定する.
        let myImage = UIImage(named: "soroban.png")
        
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        
        // 画像の表示する座標を指定する.
        myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200.0)
        
        // UIImageViewをViewに追加する.
        self.view.addSubview(myImageView)
        */
        
        println("score\(score)")
        
        /*
        // Labelを作成.
        let myLabel2: UILabel = UILabel(frame: CGRectMake(0,0,250,100))
        
        // 背景をオレンジ色にする.
        myLabel2.backgroundColor = UIColor.whiteColor()
        
        // 枠を丸くする.
        myLabel2.layer.masksToBounds = true
        
        // コーナーの半径.
        myLabel2.layer.cornerRadius = 20.0
        */
        
        // UIImageViewを作成する.
        //myImageView = UIImageView(frame: CGRectMake(0,0,100,180))
        
        //NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate2:", userInfo: nil, repeats: true)
        
        
        // 画像の表示する座標を指定する.
        //myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200.0)
        //UISwitch *sw = [[[UISwitch alloc] init] autorelease];
        //myImageView.layer.position = CGPointMake(150, 350);
        
        // UIImageViewをViewに追加する.
        //self.view.addSubview(myImageView)
        
        /*
        // Labelに文字を代入.
        if score == 1000 {
        myLabel2.text = "キムチ鍋"
        // 表示する画像を設定する.
        let myImage = UIImage(named: "5.gif")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        }else if score == 900 {
        myLabel2.text = "イタリアン"
        // 表示する画像を設定する.
        let myImage = UIImage(named: "4.gif")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        }else if score == 800{
        myLabel2.text = "丼モノ"
        // 表示する画像を設定する.
        let myImage = UIImage(named: "3.gif")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        }else if score == 700{
        myLabel2.text = "ラーメン"
        // 表示する画像を設定する.
        let myImage = UIImage(named: "2.gif")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        }else if score == 600{
        myLabel2.text = "カレー"
        // 表示する画像を設定する.
        let myImage = UIImage(named: "2.gif")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        }else if score == 500{
        myLabel2.text = "500円定食"
        // 表示する画像を設定する.
        let myImage = UIImage(named: "a.jpg")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        }else if score == 400{
        myLabel2.text = "牛丼"
        // 表示する画像を設定する.
        let myImage = UIImage(named: "a.jpg")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        }else if score == 300{
        myLabel2.text = "おにぎりとパンを買って家に帰る"
        // 表示する画像を設定する.
        let myImage = UIImage(named: "a.jpg")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        }else if score == 200{
        myLabel2.text = "カップ麺を買って家に帰る"
        // 表示する画像を設定する.
        let myImage = UIImage(named: "a.jpg")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        }else if score == 100{
        myLabel2.text = "プリンを買って家に帰る"
        // 表示する画像を設定する.
        let myImage = UIImage(named: "a.jpg")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        }else {
        myLabel2.text = "今日のご飯はありません"
        // 表示する画像を設定する.
        let myImage = UIImage(named: "2.gif")
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        }
        */
        /*
        // 文字の色を白にする.
        myLabel2.textColor = UIColor.whiteColor()
        
        // 文字の影の色をグレーにする.
        myLabel2.shadowColor = UIColor.grayColor()
        
        // Textを中央寄せにする.
        myLabel2.textAlignment = NSTextAlignment.Center
        
        // 配置する座標を設定する.
        myLabel2.layer.position = CGPoint(x: self.view.bounds.width/2,y: 300)
        
        // Viewの背景色を青にする.
        self.view.backgroundColor = UIColor.cyanColor()
        
        // ViewにLabelを追加.
        self.view.addSubview(myLabel2)
        */
        
        // Do any additional setup after loading the view.
        
        // 配置する座標を設定する.
        mylabel2.layer.position = CGPoint(x: self.view.bounds.width/2,y: 10)
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



