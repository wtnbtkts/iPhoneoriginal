//
//  ViewController.swift
//  hitnumbers
//
//  Created by Takatoshi Watanabe on 2015/06/22.
//  Copyright (c) 2015年 渡辺 貴俊. All rights reserved.
//

import UIKit

class kazuate3ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var label: UILabel!
    @IBOutlet var textView: UITextView!
    
    //時間計測用の変数.
    var cnt : Float = 5
    
    //時間表示用のラベル.
    var myLabel : UILabel!
    
    
    //当たった回数
    //    var hit = 0
    
    //挑戦した回数
    var count = 0
    
    //picker viewで選択したインデックス番号
    var selectedIndex = 0
    
    // 全て文字列の空の配列を宣言
    //    var numbers = [String]()
    var answers = [Int](count: 3, repeatedValue: 0)
    var array = [String]()
    
    //正解数
    //var correctAnswer:Int = 0
    
    /// 画面遷移時に渡す為の値
    var _param:String = "segue OK"
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ラベルを作る.
        myLabel = UILabel(frame: CGRectMake(0,0,150,50))
        myLabel.backgroundColor = UIColor.orangeColor()
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
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        
        // Delegateを設定する.
        pickerView.delegate = self
        
        // DataSourceを設定する.
        pickerView.dataSource = self
        
        textView.editable = false
        textView.text = ""
        
        //        var n = answers.count
        //        println(n)
        
        //        numbers = ["0","1","2","3","4","5","6","7","8","9"]
        
        println("\(pickerView.numberOfComponents)")
        for i in 0 ..< pickerView.numberOfComponents {
            let random = arc4random_uniform(10)
            answers[i] = Int(random)
        }
        
        println("answer is \(answers)")
    }
    
    //NSTimerIntervalで指定された秒数毎に呼び出されるメソッド.
    func onUpdate(timer : NSTimer){
        
        cnt -= 0.1
        if cnt < 0{
            cnt = 0
            //performSegueToResult()
        }
        
        //桁数を指定して文字列を作る.
        let str = "Time:".stringByAppendingFormat("%.1f",cnt)
        myLabel.text = str
        
    }
    /*
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    */
    
    /*
    pickerに表示する列数を返すデータソースメソッド.
    (実装必須)表示列
    */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    /*
    pickerに表示する行数を返すデータソースメソッド.
    (実装必須)表示個数
    */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    /*
    pickerに表示する値を返すデリゲートメソッド.表示内容
    */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return "\(row)"
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
        //        println("列: \(row)")
        //        println("値: \(numbers[row])")
    }
    
    
    @IBAction func enter(button:UIButton){
        println("************")
        count++
        
        println("count : \(count)")
        
        if (count == 5) {
            var sum = 0
            
            for i in 0 ..< pickerView.numberOfComponents {
                sum += answers[i]
            }
            
            // sum = answers.reduce(0, combine: +)
            
            textView.text = "答えの数の合計は\(sum)だよ！\n" + textView.text
        } else if (count == 10) {
            var min = answers[0]
            
            for i in 0 ..< pickerView.numberOfComponents {
                if (min > answers[i]){
                    min = answers[i]
                }
            }
            
            textView.text = "一番小さい数字は\(min)だよ！\n" + textView.text
        }
        
        var hit = 0
        //        println("\(answers)")
        for i in 0 ..< pickerView.numberOfComponents {
            
            //選択されている値のインデックス番号を取得する
            let selectedNumber = pickerView.selectedRowInComponent(i)
            let answer = answers[i]
            
            println("\(selectedNumber) -> \(answer)")
            
            if (answer == selectedNumber) {
                hit++
            }
        }
        
        println("\(hit)hit")
        
        if (hit == 3) {
            label.text = "クリア！"
            button.enabled = false
            //correctAnswer++
        } else {
            label.text = "\(hit)個正解！"
            textView.text = "\(hit)個正解！\n" + textView.text
        }
        
        /*
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
        appDelegate.correctAnswer = "100" //appDelegateの変数を操作
        */
        
        
    }
    /**
    画面遷移ボタン
    */
    @IBAction func _myButton(sender: AnyObject) {
        performSegueWithIdentifier("segue",sender: nil)
    }
    /**
    画面遷移時に値を遷移先に渡す
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segue") {
            // SecondViewControllerクラスをインスタンス化してsegue（画面遷移）で値を渡せるようにバンドルする
            var secondView : kazuateViewController = segue.destinationViewController as! kazuateViewController
            // secondView（バンドルされた変数）に受け取り用の変数を引数とし_paramを渡す（_paramには渡したい値）
            // この時SecondViewControllerにて受け取る同型の変数を用意しておかないとエラーになる
            secondView._second = _param
        }
    }
    
}

/*
import UIKit

class kazuateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var label: UILabel!
    @IBOutlet var textView: UITextView!
    
    //当たった回数
    var hit:Int = 0
    //挑戦した回数
    var count:Int = 0
    //picker viewで選択したインデックス番号
    
    // 全て文字列の空の配列を宣言
    var numbers: [String] = []
    var answers = [Int](count: 100, repeatedValue: 0)///////////////////Int型の配列をとりあえず１００個作る、中身は全部０
    var array = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Delegateを設定する.
        pickerView.delegate = self
        
        // DataSourceを設定する.
        pickerView.dataSource = self
        
        textView.editable = false
        textView.text = ""
        
        //        var answers:[String] = []///////////////////////////上で宣言してるのでこれは必要ないですね
        var n = answers.count
        println(n)
        //answers = [[NSMutableArray alloc] init]
        
        numbers = ["0","1","2","3","4","5","6","7","8","9"]
        
        for var i = 0 ; i < pickerView.numberOfComponents ; i++ {
            // do something
            //NSLog("for statement i:\(i)")
            
            var random = arc4random_uniform(10);
            answers[i] = Int(random)
        }
        
        for string in answers{
            println("\(string)")
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
    pickerに表示する列数を返すデータソースメソッド.
    (実装必須)表示列
    */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 4
    }
    
    /*
    pickerに表示する行数を返すデータソースメソッド.
    (実装必須)表示個数
    */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    /*
    pickerに表示する値を返すデリゲートメソッド.表示内容
    */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return numbers[row] as String
    }
    
    //選択時
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        println("列: \(row)")
        println("値: \(numbers[row])")
    }
    
    
    @IBAction func enter(button:UIButton){
        //var tappedButton:UIButton = sender as UIButton
        //tappedButton.setTitle("tapped", forState:UIControlState.Normal)
        
        count++;
        if (count == 5) {
            var sum = 0
            
            for var i = 0 ; i < pickerView.numberOfComponents ; i++ {
                sum = sum + Int(answers[i])//.toInt()!)
            }
            
            var lastString:String! = textView.text;
            var string:String! = NSString(format:"答えの数の合計は%dだよ！\n", sum) as String
            //文字列結合
            textView.text = string + lastString
            
            //        NSString *lastString = textView.text;
            //        NSString *string = [NSString stringWithFormat:
            //                            @"１つ目の答えは%@だよ！\n", answers[0]];
            //        textView.text = [string stringByAppendingString:
            //                         lastString];
        } else if (count == 10) {
            var num = answers[0]//.toInt()!;
            
            for var i = 0; i < pickerView.numberOfComponents ; i++ {
                if (num > answers[i]){//.toInt()!) {
                    num = answers[i]//.toInt()!;
                }
            }
            
            var lastString:String! = textView.text
            var string:String! = NSString(format:"一番小さい数字は%dだよ！\n", num) as String
            //文字列結合
            textView.text = string + lastString
            
            //        NSString *lastString = textView.text;
            //        NSString *string = [NSString stringWithFormat:
            //                            @"３つ目の答えは%@だよ！\n", answers[2]];
            //        textView.text = [string stringByAppendingString:
            //                         lastString];
        }
        
        hit = 0
        
        for var i = 0 ; i < pickerView.numberOfComponents; i++ {
            // do something
            //NSLog("for statement i:\(i)")
            
            //選択されている値のインデックス番号を取得する
            var answer = numbers[pickerView.selectedRowInComponent(i)]
            var answer2 = String(answers[i])
            
            
            
            if (answer == answer2) {
                hit = hit + 1
            }
        }
        
        
        if (hit == 4) {
            label.text = "クリア！"
            //textView.text = [NSString stringWithFormat:@"クリアまでの回数：%d", count];
            button.enabled = false
        } else {
            label.text = NSString(format:"%d個正解！", hit) as String
            var lastString:String! = textView.text
            var string:String! = NSString(format:"%d個正解！\n", hit) as String
            textView.text =  string + lastString
        }
        
        
    }
}
*/
