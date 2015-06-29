//
//  ViewController.swift
//  iPhone_0704
//
//  Created by Takatoshi Watanabe on 2015/06/27.
//  Copyright (c) 2015年 渡辺 貴俊. All rights reserved.
//

import UIKit

class flashViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    //タイマー.
    var timer : NSTimer!
    
    //スコア
    var count : Int!
    var sum : Int!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "selector(rand)", userInfo: nil, repeats: true)
        /*
        timer = [NSTimer scheduledTimerWithTimeInterval:1
        target:self
        selector:@selector(rand)
        userInfo:nil
        repeats:YES];
        */
}

    override func rand(){
    count = count + 1;
    if(count <= 3){
        var random : Int!
        let randInt = arc4random_uniform(100);
        //random = arc4random() % 100;
        sum = sum + random;
        label.text = NSString(format:"%d", random) as String
        //label.text = [NSString stringWithFormat:@"%d", random];
    }else{
        label.text = "答えは？"
        timer.invalidate()
        //[timer invalidate];
        }

        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

     @IBAction func ok(button:UIButton){
        if(textField.text.intValue == sum){
            label.text = "正解！"
        }else{
            label.text = "残念！"
        }
    
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

