//
//  ViewController.swift
//  Tab
//
//  Created by ATS on 2019/10/18.
//  Copyright © 2019 coooldoggy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnMoveDatePicekrView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

