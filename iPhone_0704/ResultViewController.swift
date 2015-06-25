//
//  ResultViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
     var correctAnswer:Int = 0
    
         var cnt : Float = 0
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var seikai: UILabel!
    
    @IBOutlet var myLabel : UILabel!
    
     private var myImageView: UIImageView!


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
        
            // Labelに文字を代入.
            if correctAnswer == 5 {
                myLabel.text = "5問中5問正解!完璧だね!!"
                // 表示する画像を設定する.
                let myImage = UIImage(named: "5.gif")
                // 画像をUIImageViewに設定する.
                myImageView.image = myImage
            }else if correctAnswer == 4{
                myLabel.text = "5問中4問正解!次は満点だ!!"
                // 表示する画像を設定する.
                let myImage = UIImage(named: "4.gif")
                // 画像をUIImageViewに設定する.
                myImageView.image = myImage
            }else if correctAnswer == 3{
                myLabel.text = "5問中3問正解!復習しよう!!"
                // 表示する画像を設定する.
                let myImage = UIImage(named: "3.gif")
                // 画像をUIImageViewに設定する.
                myImageView.image = myImage
            }else if correctAnswer == 2{
                myLabel.text = "5問中2問正解!次は半分以上!!"
                // 表示する画像を設定する.
                let myImage = UIImage(named: "2.gif")
                // 画像をUIImageViewに設定する.
                myImageView.image = myImage
            }else if correctAnswer == 1{
                myLabel.text = "5問中1問正解!もっと勉強!!"
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
                myLabel.text = "1問も合ってなかったよ!"
                // 表示する画像を設定する.
                let myImage = UIImage(named: "2.gif")
                // 画像をUIImageViewに設定する.
                myImageView.image = myImage
            }
        
        
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
