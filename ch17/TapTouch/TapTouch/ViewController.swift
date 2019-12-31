//
//  ViewController.swift
//  TapTouch
//
//  Created by ATS on 2019/12/31.
//  Copyright © 2019 coooldoggy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtMessage: UILabel!
    @IBOutlet var txtTapCount: UILabel!
    @IBOutlet var txtTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        txtMessage.text = "Touch Began"
        txtTouchCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        txtMessage.text = "Touches Moved"
        txtTouchCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        txtMessage.text = "Touch Began"
        txtTouchCount.text = String(touch.tapCount)
        txtTouchCount.text = String(touches.count)
    }


}

