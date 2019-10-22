//
//  EditViewController.swift
//  Navigation
//
//  Created by ATS on 2019/10/22.
//  Copyright © 2019 coooldoggy. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {
    var textWayValue : String = ""
    var textMessage : String = ""
    var delegate : EditDelegate?
    var isOn = false
    var isZoom = false

    @IBOutlet var txtMessage: UITextField!
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var swlsOn: UISwitch!
    @IBOutlet var btnZoom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWay.text = textWayValue
        txtMessage.text = textMessage
        swlsOn.isOn = isOn
        if isZoom {
                   btnZoom.setTitle("확대", for: UIControl.State())
               } else {
                   btnZoom.setTitle("축소", for: UIControl.State())
               }        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txtMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        }else{
            isOn = false
        }
    }
    
    
    @IBAction func ToggleZoom(_ sender: UIButton) {
        if isZoom {
            isZoom = false
            btnZoom.setTitle("축소", for: UIControl.State())
        }else{
            isZoom = true
            btnZoom.setTitle("확대", for: UIControl.State())
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
