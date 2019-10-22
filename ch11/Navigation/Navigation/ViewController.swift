//
//  ViewController.swift
//  Navigation
//
//  Created by ATS on 2019/10/22.
//  Copyright © 2019 coooldoggy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var txtMessage: UITextField!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var orgZoom = false
    var isZoom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue : use button"
        }else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue : use Bar Button"
        }
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = orgZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txtMessage.text = message
       }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
      }
    
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale: CGFloat = 2.0
        var newWidth : CGFloat, newHeight: CGFloat
        
       if isZoom {
                  if orgZoom {
                      
                  } else {
                      self.isZoom = false
                      self.orgZoom = true
                      newWidth = imgView.frame.width*scale
                      newHeight = imgView.frame.height*scale
                      imgView.frame.size = CGSize(width: newWidth, height: newHeight)
                  }
                  
                  print("Zoom: true")
              } else {
                  if orgZoom  {
                      self.isZoom = true
                      self.orgZoom = false
                      newWidth = imgView.frame.width/scale
                      newHeight = imgView.frame.height/scale
                      imgView.frame.size = CGSize(width: newWidth, height: newHeight)
                  } else {
                      
                  }
                  
                  print("Zoom: false")
              }
      }


}

