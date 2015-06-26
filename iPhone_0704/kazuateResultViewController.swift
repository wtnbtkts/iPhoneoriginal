//
//  ViewController.swift
//  hitnumbers
//
//  Created by Takatoshi Watanabe on 2015/06/22.
//  Copyright (c) 2015年 渡辺 貴俊. All rights reserved.
//

import UIKit

class kazuateResultViewController: UIViewController {
    var correctAnswer:Int = 0
    
    var cnt : Float = 0
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var seikai: UILabel!
    
    @IBOutlet var myLabel : UILabel!
    
    private var myImageView: UIImageView!
    
    //var correctAnswer :
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Labelを作成.
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,250,100))
        
        // 背景をオレンジ色にする.
        myLabel.backgroundColor = UIColor.redColor()
        
        // 枠を丸くする.
        myLabel.layer.masksToBounds = true
        
        // コーナーの半径.
        myLabel.layer.cornerRadius = 20.0
        
        // UIImageViewを作成する.
        myImageView = UIImageView(frame: CGRectMake(0,0,100,120))
        
        
        // 画像の表示する座標を指定する.
        //myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200.0)
        //UISwitch *sw = [[[UISwitch alloc] init] autorelease];
        myImageView.layer.position = CGPointMake(150, 350);
        
        // UIImageViewをViewに追加する.
        self.view.addSubview(myImageView)
        
        /*
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
        var correctAnswer = appDelegate.correctAnswer
        */
        
        /*
        // Labelに文字を代入.
        if correctAnswer == 2 {
            myLabel.text = "300円獲得!!"
            // 表示する画像を設定する.
            let myImage = UIImage(named: "5.gif")
            // 画像をUIImageViewに設定する.
            myImageView.image = myImage
        }else if correctAnswer == 1{
            myLabel.text = "200円獲得!!"
            // 表示する画像を設定する.
            let myImage = UIImage(named: "2.gif")
            // 画像をUIImageViewに設定する.
            myImageView.image = myImage
        }else if correctAnswer == 1{
            myLabel.text = "200円獲得!!"
            // 表示する画像を設定する.
            let myImage = UIImage(named: "2.gif")
            // 画像をUIImageViewに設定する.
            myImageView.image = myImage
        }else if cnt == 0{
            myLabel.text = "時間切れ"
            // 表示する画像を設定する.
            let myImage = UIImage(named: "a.jpg")
            // 画像をUIImageViewに設定する.
            myImageView.image = myImage
        }
        else {
            myLabel.text = "0円獲得!!"
            // 表示する画像を設定する.
            let myImage = UIImage(named: "2.gif")
            // 画像をUIImageViewに設定する.
            myImageView.image = myImage
        }
*/
        
        
        
        // 文字の色を白にする.
        myLabel.textColor = UIColor.whiteColor()
        
        // 文字の影の色をグレーにする.
        myLabel.shadowColor = UIColor.grayColor()
        
        // Textを中央寄せにする.
        myLabel.textAlignment = NSTextAlignment.Center
        
        // 配置する座標を設定する.
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        
        // Viewの背景色を青にする.
        self.view.backgroundColor = UIColor.cyanColor()
        
        // ViewにLabelを追加.
        self.view.addSubview(myLabel)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
