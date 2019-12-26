//
//  ViewController.swift
//  CameraPhotoLibraryMission
//
//  Created by ATS on 2019/12/26.
//  Copyright © 2019 coooldoggy. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    @IBOutlet var imgView3: UIImageView!
    
    var numImage = 0
    var imgPicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func captureImage(_ sender: UIButton) {
        if checkImageViewerCount() {
                  return
              }
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imgPicker.delegate = self
            imgPicker.sourceType = .camera
            imgPicker.mediaTypes = [kUTTypeImage as String]
            imgPicker.allowsEditing = false
            present(imgPicker, animated: true, completion: nil)
        }else{
            myAlert("Camera inaccessable", message: "Application cannot access camera")
        }
    }
    
    @IBAction func getImageFromGallery(_ sender: UIButton) {
        if checkImageViewerCount() {
            return
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
               imgPicker.delegate = self
               imgPicker.sourceType = .photoLibrary
               imgPicker.mediaTypes = [kUTTypeImage as String]
               imgPicker.allowsEditing = false
               present(imgPicker, animated: true, completion: nil)
           }else{
               myAlert("Gallery inaccessable", message: "Application cannot access gallery")
           }
    }
    
    
    @IBAction func resetImgView(_ sender: UIButton) {
        numImage = 0
        imgView1.image = nil
        imgView2.image = nil
        imgView3.image = nil
    }
    
    func myAlert(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkImageViewerCount() -> Bool{
        if numImage == 3 {
            myAlert("No Place to Show Image", message: "Press reset button and retry")
            return true
        }else{
            return false
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        switch numImage {
        case 0:
            imgView1.image = captureImage
             numImage = numImage + 1
        case 1:
            imgView2.image = captureImage
            numImage = numImage + 1
        case 2:
            imgView3.image = captureImage
            numImage = numImage + 1
        default:
             myAlert("No Place to Show Image", message: "Press reset button and retry")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       self.dismiss(animated: true, completion: nil)
   }
   
    
    
}

