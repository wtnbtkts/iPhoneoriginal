//
//  QuizViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //時間計測用の変数.
    var cnt : Float = 5
    
    //時間表示用のラベル.
    var myLabel : UILabel!

    //出題数
    var questionNumber:Int = 5
    
    //現在の問題数
    var sum:Int = 0
    
    //正解数
    var correctAnswer:Int = 0
    
    //乱数
    var random:Int = 0
    
    //クイズを格納する配列
    var quizArray = [NSMutableArray]()
    var timer: NSTimer!
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons: Array<UIButton>!
    
    @IBOutlet var Button: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["英語の頭文字を略した言葉「PR」、「P」は「Public」、では「R」何の略？","Records","Relations","Researches",2])
        quizArray.append(["パソコン周辺機器をつなぐために用いられる「USB」の正式名称は？","ユニバーサル・シリアル・バス","ユニバーサル・ソフト・ボード","ユニバーサル・シリコン・バス",1])
        quizArray.append(["「ゼネコン」は何の略？","ゼネラル・コンフィデンシャル","ゼネラル・コントラクター","ゼネラル・コントロール",2])
        quizArray.append(["英語で「yahoo」の意味は？","賢者","怠け者","田舎者",3])
        quizArray.append(["ハーブの「ローズマリー」はラテン語でどんな意味？","海のしずく","山の喜び","大地のリンゴ",1])
        quizArray.append(["英語の「japan」の意味は？","和紙","漆","筆",2])
        quizArray.append(["経済成長が著しい4ヵ国の総称「BRICs」の「I」は？","インドネシア","イタリア","インド",3])
        quizArray.append(["「クローン」の本来の意味は何でしょう？","真似","小枝","集合体",2])
        quizArray.append(["イタリア語で「ミネストローネ」の意味は？","具沢山","元気","健康",1])
        quizArray.append(["JAXA（ジャクサ）の正式名称は何でしょう？","宇宙航空研究開発機構","宇宙開発研究機構","日本航空宇宙局",1])

        //------------------------ここから下にクイズを書く------------------------//
        choiceQuiz()
        
        
        //ラベルを作る.
        myLabel = UILabel(frame: CGRectMake(0,0,150,50))
        myLabel.backgroundColor = UIColor.blueColor()
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Time:\(cnt)"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.shadowColor = UIColor.grayColor()
        myLabel.textAlignment = NSTextAlignment.Center
        myLabel.layer.position = CGPoint(x: 280,y: 130)
        self.view.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(myLabel)
        
        //タイマーを作る.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        

    }
    
    func choiceQuiz() {
        println(quizArray.count)
        //クイズの問題文をシャッフルしてTextViewにセット
        
        random = Int(arc4random_uniform(UInt32(quizArray.count)))
        quizTextView.text = quizArray[random][0] as! NSString as String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        for var i = 0; i < choiceButtons.count; i++ {
            choiceButtons[i].setTitle(quizArray[random][i+1] as! NSString as String, forState: .Normal)
            
            //どのボタンが押されたか判別するためのtagをセット
            choiceButtons[i].tag = i + 1;
        }
    }

    
    @IBAction func choiceAnswer(sender: UIButton) {
        sum++
        println("random \(random)")
        if quizArray[random][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
        }
        
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if sum == questionNumber {
            timer.invalidate()
            performSegueToResult()
        }
        quizArray.removeAtIndex(random)
        choiceQuiz()
        
    }
    
    //NSTimerIntervalで指定された秒数毎に呼び出されるメソッド.
    func onUpdate(timer : NSTimer){
        
        cnt -= 0.1
        if cnt < 0{
            cnt = 0
            timer.invalidate()
            performSegueToResult()
        }
        
        //桁数を指定して文字列を作る.
        let str = "Time:".stringByAppendingFormat("%.1f",cnt)
        myLabel.text = str
        
    }
    
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            var ResultView : ResultViewController = segue.destinationViewController as! ResultViewController

            ResultView.correctAnswer = self.correctAnswer
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


