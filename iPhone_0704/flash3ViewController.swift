//
//  ViewController.swift
//  iPhone_0704
//
//  Created by Takatoshi Watanabe on 2015/06/27.
//  Copyright (c) 2015年 渡辺 貴俊. All rights reserved.
//

import UIKit

class flash3ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    //タイマー.
    var timer : NSTimer!
    
    //スコア
    var count : Int! = 0
    var sum : Int! = 0
    
    //スコア
    var score : Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "getRandomNumber", userInfo: nil, repeats: true)
    }
    
    func getRandomNumber() {
        count = count + 1;
        if(count <= 5){
            var random:Int!
            random = Int(arc4random() % UInt32(100))
            //random = arc4random() % 100;
            sum = sum + random;
            label.text = NSString(format:"%d", random) as String
            //label.text = [NSString stringWithFormat:@"%d", random];
        }else{
            label.text = "答えは？"
            timer.invalidate()
            //[timer invalidate];
        }
        //return random()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

     @IBAction func ok(button:UIButton){
        if(textField.text.toInt() == sum){
            label.text = "正解！"
            label.textColor = UIColor.redColor()
            score = score + 300
        }else{
            label.text = "残念！"
            score = score + 0
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        score = appDelegate.ViewVal //score4にscore3の値を引き渡す
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.ViewVal = score //score4の値を引き渡す
    }
}



/*
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    timer = [NSTimer scheduledTimerWithTimeInterval:1
    target:self
    selector:@selector(rand)
    userInfo:nil
    repeats:YES];
    }
    
    - (void)rand{
        count = count + 1;
        if(count <= 3){
            int random;
            random = arc4random() % 100;
            sum = sum + random;
            label.text = [NSString stringWithFormat:@"%d", random];
        }else{
            label.text = @"答えは？";
            [timer invalidate];
        }
        }

}
*/

