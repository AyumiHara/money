//
//  ViewController.swift
//  money
//
//  Created by 原 あゆみ on 2017/03/18.
//  Copyright © 2017年 原 あゆみ. All rights reserved.
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
    
    func segueToSecondViewController() {
        self.performSegue(withIdentifier: "toSecondViewController", sender: nil)
    }



}

