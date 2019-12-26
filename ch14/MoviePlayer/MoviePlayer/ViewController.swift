//
//  ViewController.swift
//  MoviePlayer
//
//  Created by ATS on 2019/12/26.
//  Copyright © 2019 coooldoggy. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnInternalMovie(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
              let url = NSURL(fileURLWithPath: filePath!)
              playVideo(url: url)
    }
    @IBAction func btnPlayInternalMovMovie(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "Mountaineering", ofType: "mov")
        let url = NSURL(fileURLWithPath: filePath!)
        playVideo(url: url)
    }
    

    @IBAction func btnExternalMovie(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        playVideo(url: url)
    }
    
    @IBAction func btnPlayExternalMovMovie(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "Seascape", ofType: "mov")
       let url = NSURL(fileURLWithPath: filePath!)
       playVideo(url: url)
    }
    private func playVideo(url: NSURL){
        let playerController = AVPlayerViewController()
             let player = AVPlayer(url: url as URL)
             playerController.player = player
             
             self.present(playerController, animated: true){
                 player.play()
             }
    }
}

