//
//  ViewController.swift
//  168_AirRemote
//
//  Created by Thanapong Yamkamol on 21/9/2568 BE.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var mode_switch: UISwitch!
    @IBOutlet weak var air_outlet: UITextView!
    @IBOutlet weak var fan_outlet: UITextView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var picker_outlet: UIPickerView!
    let img_fan:[String] = ["0.png","1.png","2.png","3.png"]
    let fan:[Int]=[0,1,2,3]
    let air:[Int]=[15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]
    
    var isAirOn = false

        override func viewDidLoad() {
            super.viewDidLoad()

            picker_outlet.dataSource = self
            picker_outlet.delegate = self
            mode_switch.isOn = false
            air_outlet.isHidden = true
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return isAirOn ? 2 : 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==0{
                    return fan.count
                }
                else{
                    return air.count
                }
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return component == 0 ? "\(fan[row])" : "\(air[row])"
       }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if component == 0 {
                let fanLevel = fan[row]
                fan_outlet.text = "\(fanLevel)"

                img.image = UIImage(named: img_fan[row])

            } else {
                let temp = air[row]
                air_outlet.text = "\(temp)"
            }
        }

    @IBAction func mode_switch(_ sender: UISwitch) {
        isAirOn = sender.isOn
        air_outlet.isHidden = !isAirOn
        picker_outlet.reloadAllComponents()
    }
}

