//
//  ViewController.swift
//  SortAlgor
//
//  Created by 段峰 on 2020/8/7.
//  Copyright © 2020 段峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var array:[Int] = []
        for _ in 0..<10 {
            array.append(Int(arc4random()%UInt32(10)))
        }
        
        print(array)
        _ = CountSort(&array)
        
        print("------")
        print(array)
    }
}

