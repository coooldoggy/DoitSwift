//
//  DetailViewController.swift
//  Table
//
//  Created by ATS on 2019/12/19.
//  Copyright © 2019 coooldoggy. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var recieveItem = ""

    @IBOutlet var lblItem: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = recieveItem
    }
    
    func recieveItem(_ item: String){
        recieveItem = item
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
