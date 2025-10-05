//
//  ViewController.swift
//  pikleview
//
//  Created by Thanapong Yamkamol on 15/9/2568 BE.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    var flag: [String] = ["bru.png","cam.png","idn.png","lao.png","mas.png","mya.png","phl.png","sin.png","tha.png","vnm.png"]
    
    var asean: [String] = ["Brunei", "Cambodia", "Indonesia","Laos","Malaysia","Myanmar","Philippines","Singapore","Thailand","Vietnam"]
    
    @IBOutlet weak var img_show: UIImageView!
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return asean[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        img_show.image = UIImage(named: flag[row])
        lb_show.text = asean[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return asean.count

    }
    
    @IBOutlet weak var lb_show: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

