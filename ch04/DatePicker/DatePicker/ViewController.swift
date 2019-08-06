//
//  ViewController.swift
//  DatePicker
//
//  Created by ATS on 06/08/2019.
//  Copyright © 2019 ATS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String?

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector,
                             userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "HH:mm EEE"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
//        lblCurrentTime.text = String(count)
//        count = count + 1
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        let currentTime = formatter.string(from: date as Date)
        
        if (alarmTime == currentTime) {
            view.backgroundColor = UIColor.red
        }else{
            view.backgroundColor = UIColor.white
        }
    }
 

    
    
    }
    


