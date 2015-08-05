//
//  ViewController.swift
//  NHudView
//
//  Created by Nero Zuo on 15/8/5.
//  Copyright (c) 2015年 Nero Zuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        let aview = NHUDView(inView: view, animated: true)
        aview.animationCompleteBlock = { animation, finished in
            println("finished")
            aview.removeFromSuperview()
        }
        aview.text = "cool"
        aview.showAnimated(true)
    }


}

