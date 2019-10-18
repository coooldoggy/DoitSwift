//
//  ViewController.swift
//  ch09Mission
//
//  Created by ATS on 2019/10/18.
//  Copyright © 2019 coooldoggy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        label.text = String(pageControl.currentPage + 1)
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.currentPageIndicatorTintColor = UIColor.gray
    }
    
    @IBAction func pageAction(_ sender: UIPageControl) {
        label.text = String(pageControl.currentPage + 1)
    }
}

