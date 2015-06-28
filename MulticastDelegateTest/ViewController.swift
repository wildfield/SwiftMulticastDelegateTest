//
//  ViewController.swift
//  MulticastDelegateTest
//
//  Created by Dmitriy on 6/28/15.
//  Copyright (c) 2015 Dmitry K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let model = Model()
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor.whiteColor()
        
        for i in 0..<4 {
            let view = ReceiverView()
            model.delegates.add(view)
            self.view.addSubview(view)
            view.backgroundColor = UIColor.lightGrayColor()
            
            view.frame = CGRectMake(CGFloat(20 + 150 * (i % 2)),
                                    CGFloat(20 + 150 * (i / 2)),
                                    CGFloat(140.0),
                                    CGFloat(140.0))
        }
        
        for i in 0..<5 {
            let button = UIButton.buttonWithType(.System) as! UIButton
            self.view.addSubview(button)
            
            button.frame = CGRectMake(CGFloat(10 + 60 * i),
                                        CGFloat(450.0),
                                        CGFloat(50.0),
                                        CGFloat(50.0))
            button.addTarget(self, action: "onPress:", forControlEvents: .TouchUpInside)
            button.setTitle(String(i + 1), forState: UIControlState.Normal)
        }
    }
    
    func onPress(sender: UIButton) {
        model.text = sender.titleForState(UIControlState.Normal)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        model.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

