//
//  ViewController.swift
//  ImageViewMission
//
//  Created by ATS on 05/07/2019.
//  Copyright © 2019 ATS. All rights reserved.
//

import UIKit

var numImage = 0

class ViewController: UIViewController {
    var imageName = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    
    @IBOutlet var imgViewer: UIImageView!
    @IBOutlet var btnprev: UIButton!
    @IBOutlet var btnnext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgViewer.image = UIImage(named: imageName[numImage])
        // Do any additional setup after loading the view.
    }


    @IBAction func clickPrev(_ sender: UIButton) {
        numImage = numImage - 1
        if numImage<0 {
            numImage = imageName.count - 1
        }
        imgViewer.image = UIImage(named: imageName[numImage])
    }
    
    
    @IBAction func clickNext(_ sender: UIButton) {
        numImage = numImage + 1
        if numImage >= imageName.count {
            numImage = 0
        }
        
        imgViewer.image = UIImage(named: imageName[numImage])
    }
}

