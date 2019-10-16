//
//  ViewController.swift
//  WebViewMission
//
//  Created by ATS on 2019/10/16.
//  Copyright © 2019 coooldoggy. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadHtmlFile()
    }

    @IBOutlet var myWebView: WKWebView!
    
    func loadHtmlFile(){
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
}

